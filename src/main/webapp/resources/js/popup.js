
var myMusic = null;
/*
function fcOpen() {
    var check = false;
	try {
		if (myMusic.oCheckWin.value == "") {
		}
		//alert("팝업ㅇㅇ");
	} catch (exception) {
		myMusic = window.open("/Musicher/MyMusic.do", "myMusic",
				"width=500,height=600,scrollbars=no");

		//alert("팝업x");
	}
}
*/

function fcOpen(str) {
	//var myMusic;
	if(!myMusic||myMusic.closed){//if (window.opener && window.opener !== window) {
		myMusic = window.open("/Musicher/MyMusic.do?mem_id="+str, "myMusic",
		"width=550,height=600,scrollbars=no");
	}else{
    	alert("ddflnasklfnds");
    	
    }
	//myMusic.focus();
    /*if(!myMusic||myMusic.closed){
    	myMusic = window.open("/Musicher/MyMusic.do", "myMusic",
		"width=500,height=600,scrollbars=no");
    }*/
}