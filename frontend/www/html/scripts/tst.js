const spin_lat = 33;

const DemoApp = {
	data() {
		return { 
			pltwidth: Math.ceil(window.innerWidth * 0.5),
			pltheight: Math.ceil(window.innerWidth * 0.4),
			show_ctrl: true,
			n_rip: '5, 50, 500, 5000, 50000',
			n_packet: '0, 1, 2, 4, 16, 64, 128, 512, 1500',
			conn_cases: [
				[3, 4, 1, 2],
				[2, 3, 4, 1],
			],
			logs: [],
			tasks: []
		};
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
			r.chart.update();
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
				this.startSpeedTest(conn + ';' + sizes[i], 
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
					this.startSpeedTest(conn+ ';' + pkt_szs[j],
						'N_rip=' + n_rips[i]);
				}
			}
		},

		demo() {
			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'rip',
					n_rip: 5,
					passed: true,
					latency: 103
				});
			}, 1 * t0);

			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'rip',
					n_rip: 50,
					passed: false,
					error: 'ping test failed: cannot ping after 10 seconds'
				});
			}, 2 * t0);

			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'ip',
					cases: [
						{ from: 1, to: 3, pass: true },
						{ from: 3, to: 1, pass: true },
						{ from: 2, to: 4, pass: true },
						{ from: 4, to: 2, pass: true }
					]
				});
			}, 3 * t0);

			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'ip',
					cases: [
						{ from: 1, to: 2, pass: true },
						{ from: 2, to: 3, pass: false },
						{ from: 3, to: 4, pass: true },
						{ from: 4, to: 1, pass: false }
					]
				});
			}, 4 * t0);

			setTimeout(() => {
				var data = {
					id: this.genuid(),
					type: 'bw',
					pkt_szs: [0, 1, 2, 4, 16, 64, 128, 512, 1500],
					loss_rates: {
						'5': [.8, .7, .6],
						'50': [.9, .7, .6],
					}
				};
				this.logs.unshift(data);
				var self = this;
				for (var i = 3; i < data.pkt_szs.length; ++i) {
					setTimeout(((li) => {
						return () => {
							var newval = 1 / parseFloat(data.pkt_szs[li]);
							data.loss_rates['5'].push(newval);
							data.loss_rates['50'].push(newval * 1.1);
							self.updateCurve(data);
						};
					})(i), i * .4 * t0);
				}
			}, 5 * t0);
			setTimeout(() => {
				this.genSummary();
			}, 10 * t0);
		}
	},
	mounted() {
	},
}

Vue.createApp(DemoApp).mount('#speedtesterapp')

