#!/bin/bash

wheel_root=html/wheel
mkdir -p $wheel_root

downloadwheel() {
	filename=$wheel_root/$(echo $1 | tr "/" " " | awk '{print $NF}')
	if [ -f $filename ]
	then
		echo $filename exists!
	else
		curl $1 >$filename
	fi
}

downloadwheel https://cdn.bootcdn.net/ajax/libs/vue/3.0.2/vue.global.prod.js

downloadwheel https://cdn.bootcdn.net/ajax/libs/Chart.js/2.9.4/Chart.bundle.min.js 
downloadwheel https://cdn.bootcdn.net/ajax/libs/Chart.js/2.9.4/Chart.css

# downloadwheel https://cdn.bootcdn.net/ajax/libs/vue-chartjs/3.5.1/vue-chartjs.min.js
downloadwheel https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css
downloadwheel https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css.map
