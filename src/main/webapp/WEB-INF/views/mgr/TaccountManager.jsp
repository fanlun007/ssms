<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        pageContext.setAttribute("app_path", request.getContextPath());
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript">

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

        //删除课程 按钮
        function destroyTeacher(){
            //返回传送回来的集合 为JSON格式
            var selectedRows = $("#teacherList").datagrid('getSelections');
            if(selectedRows.length==0){
                $.messager.alert("未选数据！","请选择数据！");
                return;
            }
            //封装成绩数据对象
            var ClassObj =
                {
                    cno:'',
                    cn:''
                }
            var a = JSON.parse("{\"title\":\"scores\",\"data\":[]}");

            for(var i = 0; i < selectedRows.length; i++){
                var ClassObj = new Object(); //新建scoreobj对象
                ClassObj.cno = selectedRows[i].cno;
                ClassObj.cn = selectedRows[i].cn;


                a.data.push(ClassObj);   //向json 数组添加json对象
            }
            var obj = JSON.stringify(a);  //把a这个json对象 转换成 json数组

            $.messager.confirm("系统提示","确定删除" + selectedRows.length + "条数据？",function(r){
                if(r){
                    //第二个参数是传入参数    delIDs为deleteSnos result为servlet传来的jsonobject
                    $.post("BanjiDeleteServlet",{'deleteClass':obj},function(result){
                        //这个success是返回的参数，
                        if(result.success){
                            $("#teacherList").datagrid("reload");
                            alert("成功删除"+result.delNums+"条数据");
                        }
                        else{
                            alert("delete not OK!");
                        }
                    },"json");
                }
            });
        }

    </script>
</head>

<body>

<table id="teacherList" title="老师查询" class="easyui-datagrid" style="width:auto;height:auto"
       url="teacherServlet"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
       fit="true">
    <thead>
    <tr>
        <th field="checkBox" checkbox="true"></th>
        <th field="tno" width="40">老师工号</th>
        <th field="tn" width="90">老师姓名</th>
        <th field="subject" width="90">教授课程</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
    <div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addTabs('添加班级','addTeacherPage.jsp')">添加老师</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyTeacher()">删除老师</a>
    </div>
</div>
</body>
</html>
