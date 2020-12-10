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
			n_packet: '46, 128, 256, 512, 1024, 1500',
			conn_cases: [
				[3, 4, 1, 2],
				[2, 3, 4, 1],
			],
			router_name: '',
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

		loadConfig(e) {
			var reader = new FileReader();
			reader.addEventListener('load', (e) => {
				try {
					var c = JSON.parse(reader.result);
					if ('n_rip' in c) {
						this.n_rip = c.n_rip;
					}
					if ('n_packet' in c) {
						this.n_packet = c.n_packet;
					}
					if ('conn_cases' in c) {
						this.conn_cases = c.conn_cases;
					}
					if ('router_name' in c) {
						this.router_name = c.router_name;
					}
				} catch (e) {
					console.log(e);
					alert('Invalid config file');
				}
			});
			if (e.dataTransfer) {
				reader.readAsText(e.dataTransfer.files[0]);
			} else {
				reader.readAsText(e.target.files[0]);
			}
		},
		saveConfig() {
			var target = {
				n_rip: this.n_rip,
				n_packet: this.n_packet,
				conn_cases: this.conn_cases,
				router_name: this.router_name
			};
			var target_str = JSON.stringify(target);
			var a = document.createElement("a");
			a.href = "data:application/json;charset=utf-8," + target_str;
			a.download = 'config-' + this.router_name + '.json';
			document.body.appendChild(a);
			a.click();
			document.body.removeChild(a);
		},

		loadResult(e) {
			var reader = new FileReader();
			reader.addEventListener('load', (e) => {
				try {
					var c = JSON.parse(reader.result);
					if ('logs' in c) {
						this.logs = c.logs;
					}
					if ('router_name' in c) {
						this.router_name = c.router_name;
					}
				} catch (e) {
					console.log(e);
					alert('Invalid config file');
				}
			});
			reader.readAsText(e.target.files[0]);
		},
		clearResult() {
			while (this.logs.length > 0) {
				this.logs.shift();
			}
			delete this.curve_data;
		},
		saveResult() {
			var logs = [];
			for (var i = 0; i < this.logs.length; ++i) {
				if (this.logs[i].task == 'speed') {
					logs.push({
						id: this.logs[i].id,
						task: this.logs[i].task,
						pkt_szs: this.logs[i].pkt_szs,
						speeds: this.logs[i].speeds,
						ppss: this.logs[i].ppss,
						logs: this.logs[i].logs
					});
				} else {
					logs.push(this.logs[i]);
				}
			}
			var target = {
				logs: logs,
				router_name: this.router_name
			};
			var target_str = JSON.stringify(target);
			var a = document.createElement("a");
			a.href = "data:application/json;charset=utf-8," + target_str;
			a.download = 'result-' + this.router_name + '.json';
			document.body.appendChild(a);
			a.click();
			document.body.removeChild(a);
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
		drawCurve(r, type) {
			var self = this;
			setTimeout(() => {
				var div = self.$refs['logs' + r.id];
				if (!div) {
					self.drawCurve(r);
					return;
				}
				var ele = div.getElementsByTagName('canvas')[type == 'pps' ? 0 : 1];
				CanvasArt.drawCurve(ele, r, type);
			}, spin_lat);
			return 'Bandwidth of test ' + r.id;
		},
		updateCurve(r) {
			if (r.chart_pps) {
				r.chart_pps.update();
				r.chart_speed.update();
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
			var tot_pps = 0., tot_speed = 0.;
			for (var i = 0; i < data.results.length; ++i) {
				var pkt_sz = parseInt(task.arg.split(';')[1]);
				var label = task.label + ' if ' + (i + 1);
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
				tot_speed += speed;
				tot_pps += pps;
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

			var label = task.label;
			if (!(label in this.curve_data.speeds)) {
				this.curve_data.speeds[label] = [];
				this.curve_data.ppss[label] = [];
			}

			this.curve_data.speeds[label].splice(idx);
			this.curve_data.speeds[label][idx] = {
				x: pkt_sz,
				y: tot_speed
			};
			this.curve_data.ppss[label].splice(idx);
			this.curve_data.ppss[label][idx] = {
				x: pkt_sz,
				y: tot_pps
			};

			this.curve_data.logs.push({
				label: task.label,
				packet_size: pkt_sz,
                pass: pass,
				ifs: ifs,
				tot_pps: tot_pps,
				tot_speed: tot_speed
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
				arg: this.conn_cases[i].join(',') + '.',
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
					'CST. ' + conn);
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

