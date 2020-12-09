#!/bin/bash
mkdir -p birds
for i in {1..4}
do

	echo """
# for use with Raspbian buster bird v1.6

router id 23.22.22.$i;

protocol device {

}

protocol kernel {
    learn;
    persist off;
    import all;
    export all;
    metric 1024; # avoid overriding
}

protocol static {
    route 10.0.$i.0/24 via \"eth$i\";
}

protocol rip {
    import all;
    export all;
    debug all;
    interface \"eth$i\" {
        version 2;
        update time 1;
		include \"static-routing-$i.conf\";
    };
}
""" >birds/bird$i.conf
	echo >"birds/static-routing-$i.conf";
done
