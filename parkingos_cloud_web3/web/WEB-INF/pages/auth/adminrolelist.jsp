<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>角色管理</title>
<link href="css/tq.css" rel="stylesheet" type="text/css">
<link href="css/iconbuttons.css" rel="stylesheet" type="text/css">

<script src="js/tq.js?0817" type="text/javascript">//表格</script>
<script src="js/tq.public.js?0817" type="text/javascript">//表格</script>
<script src="js/tq.datatable.js?0817" type="text/javascript">//表格</script>
<script src="js/tq.form.js?0817" type="text/javascript">//表单</script>
<script src="js/tq.searchform.js?0817" type="text/javascript">//查询表单</script>
<script src="js/tq.window.js?0817" type="text/javascript">//弹窗</script>
<script src="js/tq.hash.js?0817" type="text/javascript">//哈希</script>
<script src="js/tq.stab.js?0817" type="text/javascript">//切换</script>
<script src="js/tq.validata.js?0817" type="text/javascript">//验证</script>
<script src="js/My97DatePicker/WdatePicker.js" type="text/javascript">//日期</script>
</head>
<body>
<div id="adminroleobj" style="width:100%;height:100%;margin:0px;"></div>
<script language="javascript">
/*权限*/
var authlist = T.A.sendData("getdata.do?action=getauth&authid=${authid}");
var subauth=[false,false,false,false,false];
var ownsubauth=authlist.split(",");
for(var i=0;i<ownsubauth.length;i++){
	subauth[ownsubauth[i]]=true;
}
var func = [{"value_no":-1,"value_name":"无"},{"value_no":1,"value_name":"收费功能"},
            {"value_no":2,"value_name":"巡查功能"},{"value_no":3,"value_name":"开卡功能"}];
//查看,添加,编辑,删除,编辑权限
/*权限*/
var _mediaField = [
		{fieldcnname:"角色编号",fieldname:"id",fieldvalue:'',inputtype:"text",twidth:"100" ,height:"",issort:false,edit:false},
		{fieldcnname:"名称",fieldname:"role_name",fieldvalue:'',inputtype:"text",twidth:"100" ,height:"",issort:false},
		{fieldcnname:"功能",fieldname:"func",fieldvalue:'',fieldvalue:'',inputtype:"select",noList:func,twidth:"100" ,height:"",issort:false},
		{fieldcnname:"备注",fieldname:"resume",fieldvalue:'',inputtype:"text",twidth:"200" ,height:"",issort:false}
	];
var tabtip = "角色管理";
var _adminroleT = new TQTable({
	tabletitle:tabtip,
	ischeck:false,
	tablename:"adminrole_tables",
	dataUrl:"adminrole.do",
	iscookcol:false,
	//dbuttons:false,
	buttons:getAuthButtons(),
	//searchitem:true,
	param:"action=query",
	tableObj:T("#adminroleobj"),
	fit:[true,true,true],
	tableitems:_mediaField,
	isoperate:getAuthIsoperateButtons()
});
function getAuthButtons(){
	if(subauth[1])
	return [
		{dname:"添加角色",icon:"edit_add.png",onpress:function(Obj){
				T.each(_adminroleT.tc.tableitems,function(o,j){
					o.fieldvalue ="";
				});
				Twin({Id:"cartype_add",Title:"添加角色",Width:550,sysfun:function(tObj){
					Tform({
						formname: "parking_edit_f",
						formObj:tObj,
						recordid:"id",
						suburl:"adminrole.do?action=create",
						method:"POST",
						Coltype:2,
						formAttr:[{
							formitems:[{kindname:"",kinditemts:_mediaField}]
						}],
						buttons : [//工具
							{name: "cancel", dname: "取消", tit:"取消添加",icon:"cancel.gif", onpress:function(){TwinC("cartype_add");} }
						],
						Callback:
						function(f,rcd,ret,o){
							if(ret=="1"){
								T.loadTip(1,"添加成功！",2,"");
								TwinC("cartype_add");
								_adminroleT.M();
							}else if(ret == "-2"){
								T.loadTip(1,"功能只能选择一种!",2,"");
							}else {
								T.loadTip(1,ret,2,o);
							}
						}
					});	
				}
			});
		}}
	]
	return false;
}
//查看,添加,编辑,删除,编辑权限
function getAuthIsoperateButtons(){
	var bts = [];
	if(subauth[2])
	bts.push({name:"编辑",fun:function(id){
		T.each(_adminroleT.tc.tableitems,function(o,j){
			o.fieldvalue = _adminroleT.GD(id)[j]
		});
		Twin({Id:"cartype_edit_"+id,Title:"编辑",Width:550,sysfunI:id,sysfun:function(id,tObj){
				Tform({
					formname: "cartype_edit_f",
					formObj:tObj,
					recordid:"cartype_id",
					suburl:"adminrole.do?action=edit&id="+id,
					method:"POST",
					Coltype:2,
					formAttr:[{
						formitems:[{kindname:"",kinditemts:_adminroleT.tc.tableitems}]
					}],
					buttons : [//工具
						{name: "cancel", dname: "取消", tit:"取消编辑",icon:"cancel.gif", onpress:function(){TwinC("cartype_edit_"+id);} }
					],
					Callback:
					function(f,rcd,ret,o){
						if(ret=="1"){
							T.loadTip(1,"编辑成功！",2,"");
							TwinC("cartype_edit_"+id);
							_adminroleT.M()
						}else if(ret == "-2"){
							T.loadTip(1,"功能只能选择一种!",2,"");
						}else{
							T.loadTip(1,ret,2,o)
						}
					}
				});	
			}
		})
	}});
	if(subauth[3])
	bts.push(
	{name:"删除",fun:function(id){
		Tconfirm({Title:"确认删除吗",Content:"确认删除吗",OKFn:function(){
		T.A.sendData("adminrole.do?action=delete","post","id="+id,
			function deletebackfun(ret){
				if(ret=="1"){
					T.loadTip(1,"删除成功！",2,"");
					_adminroleT.M()
				}else if(ret=="-1"){
					T.loadTip(1,"该角色正在使用中，不能删除！",2,"");
				}else{
					T.loadTip(1,ret,2,"");
				}
			}
		)}})
	}});
	if(subauth[4])
	bts.push(
	{name:"编辑权限",
		fun:function(id){
			Twin({
				Id:"edit_role"+id,
				Title:"权限设置  &nbsp;&nbsp;&nbsp;&nbsp;<font color='red'> 提示：双击关闭此对话框</font>",
				Content:"<iframe src=\"adminrole.do?action=editrole&roleid="+id+"\" style=\"width:100%;height:100%\" frameborder=\"0\"></iframe>",
				Width:T.gww()-300,
				Height:T.gwh()-200
			})
			
		}});
	bts.push(
	{name:"收费设置",
		fun:function(id){
			Twin({
				Id:"collector_set"+id,
				Title:"收费设置  &nbsp;&nbsp;&nbsp;&nbsp;<font color='red'> 提示：双击关闭此对话框</font>",
				Content:"<iframe src=\"adminrole.do?action=precollectset&roleid="+id+"\" style=\"width:100%;height:100%;over-flow:auto\" frameborder=\"0\"></iframe>",
				Width:T.gww()/2,
				Height:T.gwh()/2+100
			})
			
		}});
		bts.push(
			{name:"上班时间",
				fun:function(id){
					Twin({
						Id:"collector_set"+id,
						Title:"上班时间  &nbsp;&nbsp;&nbsp;&nbsp;<font color='red'> 提示：双击关闭此对话框</font>",
						Content:"<iframe src=\"worktime.do?role_id="+id+"\" style=\"width:100%;height:100%;over-flow:auto\" frameborder=\"0\"></iframe>",
						Width:T.gww()-100,
						Height:T.gwh()-50
					});	
		}});
	if(bts.length <= 0){return false;}
	return bts;
}


_adminroleT.C();
</script>

</body>
</html>
