<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <%
        pageContext.setAttribute("app_path", request.getContextPath());
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>添加成绩</title>

    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>


    <script type="text/javascript">

        var editRow = undefined;

        //datagrid实现双击事件
        $(function () {
            $('#tianjiacj').datagrid({
                onDblClickRow:function (rowIndex, rowData) {

                    $("#tianjiacj").datagrid({singleSelect:true});
                    single = true;

                    if(editRow != undefined){
                        $("#tianjiacj").datagrid("endEdit", editRow);
                    }
                    $("#tianjiacj").datagrid("beginEdit", rowIndex);
                    editRow = rowIndex;
                }
            });
        });

        function finishEdit() {
            if(editRow != undefined){
                $('#tianjiacj').datagrid("endEdit", editRow);
            }
            $("#tianjiacj").datagrid({singleSelect:false});
            editRow = undefined;
        }

        function addRemark() {
            $("#tianjiacj").datagrid({singleSelect:true});
            if(editRow != undefined){
                $('#tianjiacj').datagrid("endEdit", editRow);
            }
            $('#tianjiacj').datagrid('insertRow',{
                index: 0,   // 索引从0开始
                row: {
                    sno:'',
                    cno:'',
                    year:'',
                    semester:'',
                    chapter:'',
                    grade:''
                }
            });
            $('#tianjiacj').datagrid('selectRow', 0);
            $('#tianjiacj').datagrid('beginEdit', 0);
            editRow = 0;
        }

        function saveListGrade() {
            if (editRow != undefined){
                alert("未完成编辑！请点击完成编辑");
                return;
            }
            var selectedRows = $("#tianjiacj").datagrid('getSelections');
            if(selectedRows.length==0){
                $.messager.alert("未选上传数据！","请选择数据！");
                return;
            }
            //封装成绩数据对象
            var ScoreObj =
                {
                    sno:"",
                    cno:"",
                    tno:"${sessionScope.teacher.tno}",
                    year:"",
                    semester:"",
                    chapter:"",
                    grade:""
                }
            var a = JSON.parse("{\"title\":\"scores\",\"data\":[]}");
            for(var i = 0; i < selectedRows.length; i++){
                var ScoreObj = new Object(); //新建scoreobj对象
                ScoreObj.sno = selectedRows[i].sno;
                ScoreObj.cno = selectedRows[i].cno;
                ScoreObj.year = selectedRows[i].year;
                ScoreObj.semester = selectedRows[i].semester;
                ScoreObj.chapter = selectedRows[i].chapter;
                ScoreObj.grade = selectedRows[i].grade;
                ScoreObj.tno = ${sessionScope.teacher.tno};

                a.data.push(ScoreObj);   //向json 数组添加json对象
            }
            var obj = JSON.stringify(a);

            $.messager.confirm("系统提示","确定上传" + selectedRows.length + "条数据？",function(r){
                if(r){
                    //第二个参数是传入参数    delIDs为deleteSnos result为servlet传来的jsonobject
                    $.post("scoreListAddServlet",{'addSnos':obj},function(result){
                        //这个success是返回的参数，
                        if(result.success){
                            alert("成功上传 "+result.addNums+" 条数据");
                            //这里 重新加载  查询页面  的数据
                            window.parent.refreshTabData("成绩查询", window.top.reload_cjcx);
                        }
                        else{
                            alert("上传失败!" + result.errorMsg);
                        }
                    },"json");
                }
            });
        }
    </script>

</head>
<body>
<table id="tianjiacj" title="成绩添加" class="easyui-datagrid" style="width:auto;height:auto"
       url="#"
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true"
       singleSelect="true"
       <%--onDblClickRow="onDblClickRow()"--%>
       pagination="true"
       fit="true">
    <thead>
    <tr>
        <th field="checkBox" checkbox="true"></th>
        <th field="sno" width="40" editor="text">学号</th>
        <th field="cno" width="40" editor="text">课程号</th>
        <th field="year" width="40" editor="text">考试年份</th>
        <th field="semester" width="40" editor="text">学期</th>
        <th field="chapter" width="40" editor="text">单元</th>
        <th field="grade" width="40" editor="text">成绩</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
    <div>
        <a href="javascript:addRemark()" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="#">添加一行</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="saveListGrade()">上传成绩</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="finishEdit()">完成编辑</a>
    </div>
</div>
</body>
</html>
