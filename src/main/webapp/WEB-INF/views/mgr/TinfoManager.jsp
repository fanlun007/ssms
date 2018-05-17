<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
		pageContext.setAttribute("app_path", request.getContextPath());
	%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息查询页面</title>

	<link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
	<script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
	<script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
  
  
</head>

<body>

		<!--URL这里写获取数据的地址 -->
	<table id="cjcx" title="个人信息查询" class="easyui-datagrid" style="width:auto;height:auto"
		url=""
		toolbar="#toolbar"
		rownumbers="true" fitColumns="true" singleSelect="true"
        pagination="true"
        fit="true">
	<thead>
		<tr>
			<th field="sno" width="50">工号</th>
			<th field="name" width="50">姓名</th>
		</tr>
	</thead>
	</table>

<div id="toolbar">
	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editInfo()">修改信息</a>
    </div>

    
</body>
</html>