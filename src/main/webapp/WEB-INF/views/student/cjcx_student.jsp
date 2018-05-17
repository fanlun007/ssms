<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%
	pageContext.setAttribute("app_path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>学生成绩管理系统</title>

	<link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
	<script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>


	<script type="text/javascript">

		$(document).ready(function () {
			queryNianfen();
            queryXueqi();
            queryDanyuan();
            queryKecheng();
        })

		function queryKecheng() {
            var relation_count = 0;
            $("#kecheng").combobox({
                url:"queryKechengServlet",
                method:"post",
                valueField:'cno_key',
                textField:'cno_value',
                onLoadSuccess:function () {
                    if(relation_count == 0){
                        var data = $("#kecheng").combobox('getData');
                        data.unshift({'cno_key':'','cno_value':'全部'});
                        relation_count++;
                        $("#kecheng").combobox("loadData",data);
                    }
                }
            })
        }

		function queryDanyuan() {
            var relation_count = 0;
            $("#danyuan").combobox({
                url:"queryDanyuanServlet",
                method:"post",
                valueField:'chapter_key',
                textField:'chapter_value',
                onLoadSuccess:function () {
                    if(relation_count == 0){
                        var data = $("#danyuan").combobox('getData');
                        data.unshift({'chapter_key':'','chapter_value':'全部'});
                        relation_count++;
                        $("#danyuan").combobox("loadData",data);
                    }
                }
            })
        }

		function queryXueqi() {
            var relation_count = 0;
			$("#xueqi").combobox({
				url:"queryXueqiServlet",
				method:"post",
                valueField:'semester_key',
                textField:'semester_value',

                onLoadSuccess:function () {
                    if(relation_count == 0){
                        var data = $("#xueqi").combobox('getData');
                        data.unshift({'semester_key':'','semester_value':'全部'});
                        relation_count++;
                        $("#xueqi").combobox("loadData",data);
                    }
                }
			})
        }

		function queryNianfen() {
		    var relation_count = 0;

            $("#nianfen").combobox({
                url:"queryNianfenServlet",
                method:"post",
                valueField:'year_key',
                textField:'year_value',

				onLoadSuccess:function () {
					if(relation_count == 0){
					    var data = $("#nianfen").combobox('getData');
					    data.unshift({'year_key':'','year_value':'全部'});
						relation_count++;
						$("#nianfen").combobox("loadData",data);
					}
                }
            })
        }

        function Search(){
            $('#cjcx').datagrid('load',{
                sno:$('#chaxun').val(),
                year:$('#nianfen').val(),
                semester:$('#xueqi').val(),
                chapter:$('#danyuan').val(),
                cno:$('#kecheng').val()
            })
        }


        //重新打开子页面 来修改或增加成绩
        function addTabs(title, urlto) {
			var jq = top.jQuery;
			if(jq("#tabs").tabs('exists',title)){
				jq("#tabs").tabs('select',title);
			}else{
			    var content = '<iframe scrolling="auto" frameborder="0"  src="'+urlto+'" style="width:100%;height:100%"></iframe>';
			    jq("#tabs").tabs('add', {
			       title:title,
					content:content,
			       	closable:true
				});
			}
        }
	</script>
</head>

<body>

<table id="cjcx" title="成绩查询" class="easyui-datagrid" style="width:auto;height:auto"
	   url="stuGetScoreServlet?sno=${sessionScope.student.sno}"
	   toolbar="#toolbar"
	   rownumbers="true" fitColumns="true" singleSelect="false"
	   pagination="true"
	   fit="true">
	<thead>
	<tr>
		<th field="checkBox" checkbox="true"></th>
		<th field="sno" width="40">学号</th>
		<th field="cno" width="40">课程号</th>
		<th field="year" width="40">考试年份</th>
		<th field="semester" width="40">学期</th>
		<th field="chapter" width="40">单元</th>
		<th field="grade" width="40">成绩</th>
	</tr>
	</thead>
</table>

<div id="toolbar">
	<div>
		<input  type="hidden" id="chaxun" name="chaxun" value="${sessionScope.student.sno}"/>

		选择年份：<input class="easyui-combobox" style="width:65px"
					id="nianfen" name="nianfen" data-options="required:false" panelHeight="auto">

		选择学期：<input class="easyui-combobox" style="width:65px"
					id="xueqi" name="xueqi" data-options="required:false" panelHeight="auto">

		选择单元：<input class="easyui-combobox" style="width:60px"
					id="danyuan" name="danyuan" data-options="required:false" panelHeight="auto">

		选择课程：<input class="easyui-combobox" style="width:70px"
					id="kecheng" name="kecheng" data-options="required:false" panelHeight="auto">

		<a href="javascript:Search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a>
	</div>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>