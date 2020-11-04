const CounterApp = {
	data() {
		return { 
			counter: 0,
			message: 'very gg'
		};
	},
	mounted() {
		setInterval(() => {
			this.counter += 1;
		}, 1000);
	},
	methods: {
		update() {
			this.message2 = this.message;
		}
	}
}

Vue.createApp(CounterApp).mount('#counter')
