const spin_lat = 33;

var Sleeper = (t) => {
	return () => {
		return new Promise((res, rej) => {
			setTimeout(res, t); 
		});
	};
};

const TSTApp = {
	data() {
		return { 
			pltwidth: Math.ceil(window.innerWidth * 0.5),
			pltheight: Math.ceil(window.innerWidth * 0.4),
			show_ctrl: true,
			n_rip: '5, 50, 1000, 3000',
			n_packet: '60, 128, 256, 512, 1024, 1514',
			conn_cases: [
				[3, 4, 1, 2],
				[2, 3, 4, 1],
			],
			logs: [],
			tasks: []
		};
	},
	created() {
		this.monitor_interval = setInterval(() => {
			if (this.tasks.length == 0) {
				return;
			}
			if (this.tasks[0].status == 'pending') {
				this.tasks[0].status = 'running';
				this.task_promise = axios.post('/api/' + this.tasks[0].task, 
					this.tasks[0].arg)
					.then(this.getProgress);
			}
		}, 100);
	},
	methods: {
		genuid() {
			return String(Date.now()).substr(-6);
		},

		collapseCtrl() {
			this.show_ctrl = false;
		},
		expandCtrl() {
			this.show_ctrl = true;
		},
		removeCase(i) {
			this.conn_cases.pop(i);
		},
		addCase(i) {
			if (this.conn_cases.length == 0) {
				this.conn_cases.push([3, 4, 1, 2]);
			} else {
				this.conn_cases.push(this.conn_cases[this.conn_cases.length - 1]);
			}
		},
		demoStep() {
			// this.current_status += 'Testing';
		},
		drawTopo(r) {
			var self = this;
			setTimeout(() => {
				var div = self.$refs['logs' + r.id];
				if (!div) {
					self.drawTopo(r);
					return;
				}
				var ele = div.getElementsByTagName('canvas')[0];
				CanvasArt.drawTopo(ele, r);
			}, spin_lat);
			return 'Traffic topology of test ' + r.id;
		},
		drawCurve(r) {
			var self = this;
			setTimeout(() => {
				var div = self.$refs['logs' + r.id];
				if (!div) {
					self.drawCurve(r);
					return;
				}
				var ele = div.getElementsByTagName('canvas')[0];
				CanvasArt.drawCurve(ele, r);
			}, spin_lat);
			return 'Bandwidth of test ' + r.id;
		},
		updateCurve(r) {
			if (r.chart) {
				r.chart.update();
			} else {
				setTimeout(() => {
					this.updateCurve(r);
				}, spin_lat);
			}
		},

		getProgress() {
			var self = this;
			self.task_promise = axios.get('/api/get_result')
				.then((response) => {
					var data = response.data;
					if (data.status === 'done') {
						var res = {
							id: self.genuid(),
							task: self.tasks[0].task.slice(5)
						};
						if (res.task == 'rip') {
							res.n_rip = data.n_rip;
							res.passed = data.passed;
							res.latency = data.latency;
							res.error = data.message;
							self.logs.unshift(res);
						} else if (res.task == 'ip') {
							res.cases = data.cases;
							self.logs.unshift(res);
						} else if (res.task == 'speed') {
							self.addSpeedTestResult(self.tasks[0], data);
						}
						self.tasks.shift();
						return;
					}
					if (data.status === 'busy') {
						self.tasks[0].duration = data.duration;
						if (self.tasks[0].task == 'test_rip') {
							self.tasks[0].max_routes = data.max_routes;
						}
						self.task_promise = self.task_promise
							.then(Sleeper(100))
							.then(self.getProgress);
					} else if (data.status === 'error') {
						alert('Internal error ' + data.message);
						self.tasks.shift();
					}
				});
		},

		addSpeedTestResult(task, data) {
			if (!this.curve_data) {
				this.curve_data = {
					id: this.genuid(),
					task: 'speed',
					pkt_szs: [],
					speeds: {},
					ppss: {},
					logs: []
				};
				this.logs.unshift(this.curve_data);
			} else {
				var idx = this.logs.indexOf(this.curve_data);
				this.logs.splice(idx, 1);
				this.logs.unshift(this.curve_data);
			}
			var ifs = [];
            var pass = true;
			for (var i = 0; i < data.results.length; ++i) {
				var label = task.label + ' if ' + i;
				var pkt_sz = parseInt(task.arg.split(';')[1]);
				var idx = this.curve_data.pkt_szs.indexOf(pkt_sz);
				if (idx == -1) {
					this.curve_data.pkt_szs.push(pkt_sz);
					idx = this.curve_data.pkt_szs.indexOf(pkt_sz);
				}
				var r = data.results[i];
				var speed = parseFloat(r.recv_bytes + r.recv_frames * 24) 
					* 8.0 / parseFloat(data.duration) * 1e-3;
				var pps = parseFloat(r.recv_frames) / 
					parseFloat(data.duration) * 1e-3;
				if (!(label in this.curve_data.speeds)) {
					this.curve_data.speeds[label] = [];
					this.curve_data.ppss[label] = [];
				}

				this.curve_data.speeds[label].splice(idx);
				this.curve_data.speeds[label][idx] = speed;
				this.curve_data.ppss[label].splice(idx);
				this.curve_data.ppss[label][idx] = pps;
				ifs.push({
                    recv_frames: r.recv_frames,
                    err_frames: r.err_frames,
                    recv_bytes: r.recv_bytes,
                    err_bytes: r.err_bytes,
                    speed: speed,
                    pps: pps
				});
                if (pps < 1.4) {
                    pass = false;
                }
			}

			this.curve_data.logs.push({
				label: label,
				packet_size: pkt_sz,
                pass: pass,
				ifs: ifs
			});
			setTimeout(() => {
				this.updateCurve(this.curve_data);
			}, spin_lat);
		},

		genSummary() {
			this.logs.unshift({
				id: this.genuid(),
				type: 'summary'
			});
		},

		startRIPTest(sz) {
			if (!sz) {
				sz = this.n_rip.split(',').pop();
			}
			sz = sz.trim();
			this.tasks.push({
				task: 'test_rip',
				status: 'pending',
				arg: sz 
			});
		},
		startIPTest(i) {
			this.tasks.push({
				task: 'test_ip',
				status: 'pending',
				arg: this.conn_cases[i].join(','),
			});
		},
		startAllIPTests() {
			for (var i = 0; i < this.conn_cases.length; ++i) {
				this.startIPTest(i);
			}
		},
		startSpeedTest(arg, label) {
			this.tasks.push({
				task: 'test_speed',
				status: 'pending',
				label: label,
				arg: arg
			});
		},
		startSpeedTests() {
			var sizes = this.n_packet.split(',');
			var conn = this.conn_cases[this.conn_cases.length - 1].join(',');
			for (var i = 0; i < sizes.length; ++i) {
				var sz = sizes[i].trim() + '.';
				this.startSpeedTest(conn + ';' + sz, 
					'Custom speed test ' + conn);
			}
		},

		startAllTests() {
			var n_rips = this.n_rip.split(',');
			var conn = this.conn_cases[this.conn_cases.length - 1].join(',');
			var pkt_szs = this.n_packet.split(',');
			this.startRIPTest(n_rips[0]);
			this.startAllIPTests();
			for (var i = 0; i < n_rips.length; ++i) {
				if (i > 0) {
					this.startRIPTest(n_rips[i]);
				}
				for (var j = 0; j < pkt_szs.length; ++j) {
					var sz = pkt_szs[j].trim() + '.';
					this.startSpeedTest(conn+ ';' + sz,
						'N_rip=' + n_rips[i]);
				}
			}
		}
	}
};

Vue.createApp(TSTApp).mount('#speedtesterapp')

