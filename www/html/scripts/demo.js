const DemoApp = {
	data() {
		return { 
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
		drawTopo(i) {
			var self = this;
			setTimeout(() => {
				var div = self.$refs['logs' + i];
				if (!div) {
					self.drawTopo(i);
					return;
				}
				var ele = div.getElementsByTagName('canvas')[0];
				CanvasArt.drawTopo(ele, this.logs[i]);
			}, 100);
			return 'Traffic topology of test ' + i;
		},

		startAllTests() {
			this.current_status = 'Testing rip 1';
			this.report_title = 'Testing';

			const t0 = 100;

			setTimeout(() => {
				this.logs.push({
					type: 'rip',
					n_rip: 5,
					passed: true,
					latency: 103
				});
				this.current_status = 'Testing rip 2';
			}, 1 * t0);

			setTimeout(() => {
				this.logs.push({
					type: 'rip',
					n_rip: 50,
					passed: false,
					error: 'ping test failed: cannot ping after 10 seconds'
				});
				this.current_status = 'Test done';
				this.report_title = 'Final results';
			}, 2 * t0);

			setTimeout(() => {
				this.logs.push({
					type: 'ip',
					cases: [
						{ from: 1, to: 3, pass: true },
						{ from: 3, to: 1, pass: true },
						{ from: 2, to: 4, pass: true },
						{ from: 4, to: 2, pass: true }
					]
				});
				this.current_status = 'Test done';
				this.report_title = 'Final results';
			}, 3 * t0);

			setTimeout(() => {
				this.logs.push({
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
		}
	},
	mounted() {
	},
}

Vue.createApp(DemoApp).mount('#speedtesterapp')

