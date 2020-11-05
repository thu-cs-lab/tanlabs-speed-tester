const spin_lat = 33;

const DemoApp = {
	data() {
		return { 
			pltwidth: Math.ceil(window.innerWidth * 0.5),
			pltheight: Math.ceil(window.innerWidth * 0.4),
			show_ctrl: true,
			report_title: 'Test pending, no result',
			n_rip: '5, 50, 500, 5000, 50000',
			n_packet: '0, 1, 2, 4, 16, 64, 128, 512, 1500',
			current_status: '',
			conn_cases: [
				[3, 4, 1, 2],
				[2, 3, 4, 1],
			],
			logs: []
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

		startAllTests() {
			this.current_status = 'Testing rip 1';
			this.report_title = 'Testing';

			const t0 = 1000;

			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'rip',
					n_rip: 5,
					passed: true,
					latency: 103
				});
				this.current_status = 'Testing rip 2';
			}, 1 * t0);

			setTimeout(() => {
				this.logs.unshift({
					id: this.genuid(),
					type: 'rip',
					n_rip: 50,
					passed: false,
					error: 'ping test failed: cannot ping after 10 seconds'
				});
				this.current_status = 'Testing connectivity 1';
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
				this.current_status= 'Testing connectivity 2';
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
				this.current_status = 'Test done';
				this.report_title = 'Final results';
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
				this.current_status = 'Test done';
				this.report_title = 'Final results';
			}, 10 * t0);
		}
	},
	mounted() {
	},
}

Vue.createApp(DemoApp).mount('#speedtesterapp')

