<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>车位空闲趋势分析</title>
<link rel="stylesheet" type="text/css" href="js/anlysis/style.css?v=20100302" />
<script type="text/javascript" src="js/anlysis/jquery.min.js"></script>
<script type="text/javascript" src="js/anlysis/highcharts.js"></script>
<script type="text/javascript" src="js/anlysis/aanalysis.js"></script>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript">//日期</script>

</head>
<script type="text/javascript">
var comid = ${_comid};
</script>
<body >
<div id="data_container">
<!--顶部开始-->
<div class="top">
<ul class="title"><li class="parentmenu">${pname }&raquo; 车位空闲趋势分析 &raquo; </li>
</ul>
<ul class="search">
<span class="search_type">
    
<select name="rangeSelect" id="rangeSelect" size="1" onChange="javascript:changeRange(this);" >
    <option  value="0" >今天</option>
    <option  value="1" >昨天</option>
  </select>
</span>
<span id="firstdateinput" class="search_text">
日期：<input  class="Wdate" type="text" name="startDateSelect" id="qdate" align="absmiddle" readonly  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',startDate:'%y-%M-01'})" />
</span>
<span id="seconddateinput" class="search_text">
时间：<input  class="Wdate" onclick="WdatePicker({dateFmt:' HH:dd'})" type="text" name="endDateSelect" id="btime" align="absmiddle" readonly   />
-<input  class="Wdate" onclick="WdatePicker({dateFmt:' HH:dd'})" type="text" name="endDateSelect" id="etime" align="absmiddle" readonly   />
</span>
<span class="search_button">
<span class="button_light_green"><button name="" onclick="loaddata()"><span class="confirm"><img src="js/anlysis/spacer.gif" /></span>确定</button></span>
</span>
</ul>
</div>
<!--顶部结束-->
<!--工具栏开始-->
<div class="tooles">
<span id="tips" class="count_tips">&nbsp;&nbsp;以15分钟为单位统计一天数据</span>
<!-- <span class="tooles_botton">
<span class="button"><button name="" onclick="javascript:print();"><span class="print2"><img src="js/anlysis/spacer.gif" /></span>打印</button></span>
</span> -->
</div>
<!--工具栏结束-->
<div class="float_clear"></div><!--清除浮动-->

<script type="text/javascript">
</script>

<div id="chart_container" style="width: 100%; height: 400px; margin:10px auto;float:left"></div>

</body>
</html>
