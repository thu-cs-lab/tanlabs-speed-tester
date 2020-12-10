var CanvasArt = {
    drawRouter(ctx, bx, by, rx, ry, color) {
        bx -= rx * .5;
        by -= ry * .5;
        ctx.strokeStyle = color;
        ctx.lineWidth = 2;
        var r = rx / Math.sqrt(2);
        ctx.beginPath();
        ctx.moveTo(bx + rx, by);
        ctx.lineTo(bx + rx, by + .5 * rx);
        ctx.arc(bx + .5 * rx, by, r, 0.25 * Math.PI, 0.75 * Math.PI);
        ctx.lineTo(bx, by);
        ctx.stroke();
        ctx.fillStyle = '#ffffff';
        ctx.fill();

        ctx.fillStyle = color;
        ctx.beginPath();
        ctx.arc(bx + .5 * rx, by + .5 * rx, r, 1.25 * Math.PI, 1.75 * Math.PI);
        ctx.arc(bx + .5 * rx, by - .5 * rx, r, 0.25 * Math.PI, 0.75 * Math.PI);
        ctx.fill();
    },

    drawArrow(ctx, x1, y1, x2, y2, sz) {
        with (Math) {
            var dx = x2 - x1;
            var dy = y2 - y1;
            var len = sqrt(pow(dx, 2) + pow(dy, 2));
            var rat = sz / len;
            var sx = x1 * rat + x2 * (1. - rat);
            var sy = y1 * rat + y2 * (1. - rat);
            dx *= rat;
            dy *= rat;
        }
        ctx.beginPath();
        ctx.moveTo(x2, y2);
        ctx.lineTo(sx - dy, sy + dx);
        ctx.lineTo(sx + dy, sy - dx);
        ctx.lineTo(x2, y2);
        ctx.fill();
    },

    drawConnection(ctx, x1, y1, x2, y2, text, arrow) {
        var rat = .9;
        var rrat = 1. - rat;
        var nx1 = x1 * rat + x2 * rrat;
        var ny1 = y1 * rat + y2 * rrat;
        var nx2 = x1 * rrat + x2 * rat;
        var ny2 = y1 * rrat + y2 * rat;
        ctx.beginPath();
        ctx.moveTo(nx1, ny1);
        ctx.lineTo(nx2, ny2);
        ctx.stroke();
        if (text) {
            ctx.fillText(text, 
                (x1 + x2) * .5,
                (y1 + y2) * .5);
        }
        if (arrow) {
            ctx.fillStyle = ctx.strokeStyle;
            ctx.setLineDash([30, 0]);
            this.drawArrow(ctx, nx1, ny1, nx2, ny2, arrow);
        }
    },

	drawTopo(cvs, data) {
        const student_color = '#aa33cc';
        const judge_color = '#3333cc';
        const fail_color = '#ff2222';
        const pass_color = '#22ff22';

        var width = cvs.width;
        var height = cvs.height;

        var cx = width / 2;
        var cy = height / 2;
        var dx = Math.ceil(cx * 0.7);
        var dy = Math.ceil(cy * 0.7);
        var rx = Math.ceil(cx / 7);
        var ry = Math.ceil(cy / 7);

        var deltas = [[-1, 0], [0.2, -1], [1, 0], [-0.2, 1]];
		var ctx = cvs.getContext('2d');

        ctx.fillStyle = '#ffffff';
        ctx.fillRect(0, 0, width, height);

        var sx = cx;
        var sy = cy - ry * 1.8;
        var judge_pos = [];
        for (var i = 0; i < 4; ++i) {
            var bx = cx + deltas[i][0] * dx;
            var by = cy + deltas[i][1] * dy;
            judge_pos[i + 1] = [bx, by];
            this.drawRouter(ctx, bx, by, rx, ry, judge_color);
            ctx.lineWidth = 1;
            ctx.font = '18px helvetica';
            ctx.fillStyle = '#000000';
            ctx.fillText('External router ' + (i + 1), 
                bx - .7 * rx, 
                by + .7 * ry);
            ctx.strokeStyle = '#777777';
            ctx.setLineDash([15, 15]);
            ctx.lineWidth = 1;
            this.drawConnection(ctx, bx, by, sx, sy, '');
            ctx.setLineDash([1, 0]);
        }

        for (var i in data.cases) {
            var f = data.cases[i].from;
            var t = data.cases[i].to;
            var color = pass_color;
            if (!data.cases[i].pass) {
                color = fail_color;
            }
            ctx.strokeStyle = color;
            ctx.fillStyle = color;
            ctx.lineWidth = 5;
            ctx.setLineDash([30, 30]);
            this.drawConnection(ctx, 
                judge_pos[f][0] - .3 * rx * deltas[f - 1][1],
                judge_pos[f][1] - .3 * ry * deltas[f - 1][0],
                judge_pos[t][0] + .3 * rx * deltas[t - 1][1],
                judge_pos[t][1] + .3 * ry * deltas[t - 1][0],
                data.cases[i].pass ? '' : 'Broken!', rx * .3);
        }

        this.drawRouter(ctx, sx, sy, rx, ry, student_color);
        ctx.font = '18px helvetica';
        ctx.fillStyle = '#000000';
        ctx.fillText('Student router', sx + rx * 0.7, sy - ry * 0.2);
    },

    drawCurve(cvs, data, type) {
        var ctx = cvs.getContext('2d');
        var datasets = [];

        data.datasets = {};

        var colors = ['blue', 'red', 'green', 'orange', 'purple', 'cyan', 'skyblue', 'lightgreen'];

        for (var i in data.speeds) {
            data.datasets[i] = {
                idx: datasets.length,
                len: data.speeds[i].length
            };
			var color = colors.pop();
			if (type == 'speed') {
				datasets.push({
					label: i,
					pointStyle: 'circle',
					pointRadius: 4,
					data: data.speeds[i],
					borderColor: color,
					showLine: true,
					fillColor: 'grey'
				});
			}
			if (type == 'pps') {
				datasets.push({
					label: i,
					pointStyle: 'circle',
					pointRadius: 4,
					data: data.ppss[i],
					borderColor: color,
					showLine: true,
					fillColor: 'grey'
				});
			}
        }
		var yAxes = [];
		if (type == 'speed') {
			yAxes.push({
				id: 'speed',
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'Bandwidth/Mbps'
				}
			});
		}
		if (type == 'pps') {
			yAxes.push({
				id: 'pps',
				display: true,
				scaleLabel: {
					display: true,
					labelString: 'PPS/M'
				}
			});
		}
        data['chart_' + type] = new Chart(ctx, {
            type: 'scatter',
            data: {
                datasets: datasets
            },
            options: {
				legend: {
					labels: {
						usePointStyle: true
					}
				},
                animation: {
                    duration: 0
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'IP packet frame size'
                        }
                    }],
					yAxes: yAxes
                }
            }
        });
    }
};
