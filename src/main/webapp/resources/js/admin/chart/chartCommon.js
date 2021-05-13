
var
	chartOptions = {
		scaleShowVerticalLines: false,
		responsive: true,
		legend: {
			position: 'top'
		},
		scales: {
		
			yAxes: [{
				ticks: {
					min :0,
					max : 100,
					stepSize: 10
				},
			}]
		}
	};


var chartDataSet = {
	labels: [],
	datasets: [
		{
			label: '',
			borderColor: 'blue',
			data: [],
		    borderJoinStyle: 'miter',
		    pointBorderColor: "black",
		    pointBackgroundColor: "white"
		}
	]
};



function maxValue(data){

    var maxValue = 100000;
    
    console.log(data);
   
    data.forEach(function(value, i){
    	console.log(value);
        if(maxValue < value) {
            maxValue = value;
        }
    });

    return maxValue;
}


function getStepSize(value) {
 
	var stepSize = 0  ;
 
	 
	if(value >= 500000000) {
		stepSize = 100000000;
	}else if(value >= 100000000) {
	   stepSize = 50000000;
	}else  if(value >= 50000000) {
	   stepSize = 10000000;
	}else  if(value >= 10000000) {
	   stepSize = 5000000;
	}else  if(value >= 5000000) {
	   stepSize = 1000000;
	}else  if(value >= 1000000) {
	   stepSize = 500000;
	}else  if(value >= 500000) {
	   stepSize = 100000;
	}else  if(value >= 100000) {
	   stepSize = 10000;
	}else  if(value >= 10000) {
	   stepSize = 5000;
	}else  {
	   stepSize = 1000;
	}

    return stepSize;
}
