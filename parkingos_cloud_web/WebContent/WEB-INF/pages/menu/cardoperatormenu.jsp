<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>停车宝业务系统</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<link href="css/iconbuttons.css" rel="stylesheet" type="text/css">
<style>
	html, body{ background-position:0 -65px;margin:0;padding:0}
	#page-tabs {margin: 0px; padding:0px;  overflow: hidden; position: absolute;left:200px;top:33px;height:26px;}
</style>
</head>
<body onload="init()">
<script>
var isIE = function(){
	var w = navigator.userAgent.toLowerCase();
	var ieMode = document.documentMode;
	return (/msie/.test(w) && !/opera/.test(w))?(!window.XMLHttpRequest?6:(ieMode?ieMode:7)):false
	//return document.documentMode == 10 ?10:((s =navigator.userAgent.toLowerCase().match(/msie ([\d.]+)/))?  parseInt(s[1]) : false);
};
function gwh(_h) {
	var h,_h=_h?_h:0;
	if (window.innerHeight) {
		h = window.innerHeight;
	}else{
		h = document.documentElement.offsetHeight || document.body.clientHeight || 0;
	};
	if(isIE&&isIE<9)
	{
		h -= 3
	}
	h = h<_h?_h:h;
	return parseInt(h);
}
function gww(_w) {
	var w,_w=_w?_w:0;
	//alert(document.body.clientWidth )
	if (window.innerWidth) {
		w = window.innerWidth;
	}else{
		w = document.documentElement.offsetWidth || document.body.clientWidth || 0;
	};
	w = w<_w?_w:w;
	return parseInt(w);
}
function switchTag(tag,url){
    var menulength= document.getElementsByTagName('li').length;
	if(tag.parentNode.className.indexOf("selected") != -1)return;
	for(var i=0;i<menulength;i++){
		if(document.getElementsByTagName('li')[i].className.indexOf("last") != -1){
			document.getElementsByTagName('li')[i].className='last';
		}else{
    		document.getElementsByTagName('li')[i].className='';
		};
		document.getElementById("iframe-"+(i+1)+"-div").style.display = "none";
		var bb = document.getElementById("iframe-"+(i+1)+"-iframe");
		if(bb != undefined){
    		bb.style.display = "none";
		}
	}
	tag.parentNode.className += ' selected';
	
	var oDiv = document.getElementById(tag.id+"-div");
	var iDiv = document.getElementById(tag.id+"-iframe");
	oDiv.style.display = "block";
	oDiv.style.marginTop='66px';
	if(iDiv != undefined)
    	iDiv.style.display = "block";
	createIframe(oDiv,tag.id,url);
}

function createIframe(oDiv,id,url){
	var oFrameName = id +"-iframe";
	var iframe =  document.getElementById(oFrameName);//jQuery("#"+tag.id+"-iframe");
	if(iframe == undefined){
		var oFrame = isIE()&&isIE()<8 ? document.createElement("<iframe name=\"" + oFrameName + "\" id=\"" + oFrameName + "\">") : document.createElement("iframe");
		oFrame.name = oFrameName;
		oFrame.setAttribute("frameborder","0");
		oFrame.setAttribute("scrolling","auto");
		oFrame.id = oFrameName;
		oFrame.style.width = "100%";
		//oFrame.style.height = "100%";
		oFrame.style.height	= gwh() - 67 + "px";//document.documentElement.scrollHeight - 30 +"px";
		if(isIE()&&isIE()<11) {
			window.attachEvent("onresize",function(){oFrame.style.height = gwh() - 67 +"px"})
		}else{
    		window.addEventListener("resize",function(){oFrame.style.height = gwh() - 67 +"px"},false)
		};
		
		oFrame.setAttribute("src",url);
		//oDiv.insertBefore(oFrame,oDiv.childNodes[0]);
		oDiv.appendChild(oFrame);
	}
}
</script>
<div style="width:100%;float:left;height:58px;left:0px;top:0px;background-image:url('images/page_top_bg.png');position: absolute;overflow:hidden;">
   <div style='width:200px;margin-left:19px;margin-top:10px;float:left;'><img src='images/logo_top.png'/></div> 
    <div id="page-tabs"><ul>
    <li id="tag1">
		<div></div> <a href="#" id="iframe-1" onclick="switchTag(this,'vipuser.do?role=15')">会员管理</a>
	</li>
	<li id="tag2">
		<div></div> <a href="#" id="iframe-2" onclick="switchTag(this,'order.do?role=15')">订单管理</a>
	</li>
	<li id="tag3">
		<div></div> <a href="#" id="iframe-3" onclick="switchTag(this,'package.do?role=15')">套餐管理</a>
	</li>
	</ul>
    </div>
     <div style='float:right;margin-right:35px;margin-top:13px;' >欢迎您 【${nickname}】&nbsp;&nbsp;&nbsp;&nbsp;<span style='cursor:pointer;' onclick='logout()'><img src='images/page_logout.png'/>&nbsp;退出</span></div>
</div>
<div style="width:100%;height:8px;top:58px;position: absolute;background-image:url('images/page_top_buttom.png');overflow:hidden;">
</div>
<div id="iframe-1-div" name = "iframe-1-div" style="display:block;margin-top:66px;"></div>
<div id="iframe-2-div" name = "iframe-2-div" style="display:none"></div>
<div id="iframe-3-div" name = "iframe-3-div" style="display:none"></div>
<script language="javascript">
function init(){
	document.getElementById('tag1').className='selected';
	createIframe(document.getElementById('iframe-1-div'),'iframe-1','vipuser.do?role=15');
	var obj = document.getElementById("page-tabs").firstChild;
	var tags = obj.getElementsByTagName("li");
	var _tl = tags.length;
	for(var i = _tl - 1;i<_tl;i--)
	{
		if(tags[i].style.display != "none"){
			tags[i].className = "last";
			tags[i].innerHTML += "<div class='last'></div>";
			break;
		}
	}
}
function  logout(){
	location = 'login.do';
}
</script>
</body>
</html>