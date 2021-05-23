function createUrlEncodeData(params){
	let urlEncodedData = "", urlEncodedDataPairs = [], name;
	for( name in params ) {
	 urlEncodedDataPairs.push(encodeURIComponent(name)+'='+encodeURIComponent(params[name]));
	 urlEncodedData +=encodeURIComponent(name)+'='+encodeURIComponent(params[name])+'&';
	}
	if(urlEncodedData.slice(-1)=='&'){
		return urlEncodedData.substring(0, urlEncodedData.length-1);
	}else
	return urlEncodedData;
}

function get(url, params, func) {
	var urlEncodedData=  createUrlEncodeData(params);
	var xhttp;
	if (window.XMLHttpRequest) {
		// code for modern browsers
		xhttp = new XMLHttpRequest();
	} else {
		// code for old IE browsers
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			func(this.responseText);
			// console.log(this.responseText);
		}
	};
	//http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhttp.open("GET", url, true);
	// xhttp.setRequestHeader('Access-Control-Allow-Headers', '*');
	xhttp.send(urlEncodedData);
}
function getNoParams(url, func) {
	var xhttp;
	if (window.XMLHttpRequest) {
		// code for modern browsers
		xhttp = new XMLHttpRequest();
	} else {
		// code for old IE browsers
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			func(this.responseText);
			// console.log(this.responseText);
		}
	};
	//http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhttp.open("GET", url, true);
	// xhttp.setRequestHeader('Access-Control-Allow-Headers', '*');
	xhttp.send();
}


function post(url, params, func) {
	
	var xhttp;
	if (window.XMLHttpRequest) {
		// code for modern browsers
		xhttp = new XMLHttpRequest();
	} else {
		// code for old IE browsers
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4)
			func(this.status);
		if (this.readyState == 4 && this.status == 200) {
			//func(this.responseText);
			// console.log(this.responseText);
		}
	};
	xhttp.open("POST", url, true);
	xhttp.setRequestHeader('Content-type', 'application/json');
	//xhttp.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhttp.setRequestHeader('charset', 'UTF-8');
	// xhttp.setRequestHeader('Access-Control-Allow-Headers', '*');
	xhttp.send(JSON.stringify(params));
}
// get("http://localhost:8080/CDW/Test", console.log);
