<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        pageContext.setAttribute("app_path", request.getContextPath());
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生成绩管理系统</title>

    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>


    <script type="text/javascript">

        $(function () {
            $("#fm_sno").textbox('disable'); //设置输入框为禁用
            $("#fm_cno").textbox('disable');
            $("#fm_year").textbox('disable');
            $("#fm_semester").textbox('disable');
            $("#fm_chapter").textbox('disable');
            $("#fm_tno").textbox('disable');
        })

        //此页面是要求被刷新的页面,定义刷新方法
        window.top["reload_cjcx"] = function () {
            $("#cjcx").datagrid("reload");
        }

        var url;

        $(document).ready(function () {
            queryNianfen();
            queryXueqi();
            queryDanyuan();
            queryKecheng();
        })

        function queryKecheng() {
            var relation_count = 0;
            $("#kecheng").combobox({
                url: "queryKechengServlet",
                method: "post",
                valueField: 'cno_key',
                textField: 'cno_value',
                onLoadSuccess: function () {
                    if (relation_count == 0) {
                        var data = $("#kecheng").combobox('getData');
                        data.unshift({'cno_key': '', 'cno_value': '全部'});
                        relation_count++;
                        $("#kecheng").combobox("loadData", data);
                    }
                }
            })
        }

        function queryDanyuan() {
            var relation_count = 0;
            $("#danyuan").combobox({
                url: "queryDanyuanServlet",
                method: "post",
                valueField: 'chapter_key',
                textField: 'chapter_value',
                onLoadSuccess: function () {
                    if (relation_count == 0) {
                        var data = $("#danyuan").combobox('getData');
                        data.unshift({'chapter_key': '', 'chapter_value': '全部'});
                        relation_count++;
                        $("#danyuan").combobox("loadData", data);
                    }
                }
            })
        }

        function queryXueqi() {
            var relation_count = 0;
            $("#xueqi").combobox({
                url: "queryXueqiServlet",
                method: "post",
                valueField: 'semester_key',
                textField: 'semester_value',

                onLoadSuccess: function () {
                    if (relation_count == 0) {
                        var data = $("#xueqi").combobox('getData');
                        data.unshift({'semester_key': '', 'semester_value': '全部'});
                        relation_count++;
                        $("#xueqi").combobox("loadData", data);
                    }
                }
            })
        }

        function queryNianfen() {
            var relation_count = 0;

            $("#nianfen").combobox({
                url: "queryNianfenServlet",
                method: "post",
                valueField: 'year_key',
                textField: 'year_value',

                onLoadSuccess: function () {
                    if (relation_count == 0) {
                        var data = $("#nianfen").combobox('getData');
                        data.unshift({'year_key': '', 'year_value': '全部'});
                        relation_count++;
                        $("#nianfen").combobox("loadData", data);
                    }
                }
            })
        }

        function Search() {
            $('#cjcx').datagrid('load', {
                sno: $('#chaxun').val(),
                year: $('#nianfen').val(),
                semester: $('#xueqi').val(),
                chapter: $('#danyuan').val(),
                cno: $('#kecheng').val()
            })
        }

        function saveGrade() {
            var urlstring = String(url);
            var sno = $("#fm_sno").textbox('getValue');
            var cno = $("#fm_cno").textbox('getValue');
            var year = $("#fm_year").textbox('getValue');
            var semester = $("#fm_semester").textbox('getValue');
            var chapter = $("#fm_chapter").textbox('getValue');
            var grade = $("#fm_grade").val();
            var tno = $("#fm_tno").textbox('getValue');
            $("#fm").form("submit", {
                url: "scoreModifyServlet?sno=" + sno + "\&cno=" + cno + "\&year=" + year + "\&semester=" +
                encodeURI(encodeURI(semester)) + "\&chapter=" + chapter + "\&grade=" + grade + "\&tno=" + tno,
                onSubmit: function () {
                    return $(this).form("validate");
                },
                success: function (result) {
                    if (result.errorMsg) {
                        $.messager.alert("系统提示", result.errorMsg);
                        return;
                    } else {
                        $.messager.alert("系统提示", "保存成功");
//					    resetValue();
                        $("#dlg").dialog("close");
                        $("#cjcx").datagrid("reload");
                    }
                }
            });
        }

        //添加信息对话框的 关闭按钮
        function closeDialog() {
            $("#dlg").dialog("close");
            $("#sno").val("");
            $("#cno").val("");
            $("#semester").val("");
            $("#chapter").val("");
            $("#year").val("");
            $("#grade").val("");
        }


        //重新打开子页面 来修改或增加成绩
        function addTabs(title, urlto) {
            var jq = top.jQuery;
            if (jq("#tabs").tabs('exists', title)) {
                jq("#tabs").tabs('select', title);
            } else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="' + urlto + '" style="width:100%;height:100%"></iframe>';
                jq("#tabs").tabs('add', {
                    title: title,
                    content: content,
                    closable: true
                });
            }
        }

        //修改成绩按钮
        function modifyGrade() {
            var selectRows = $("#cjcx").datagrid('getSelections');
            if (selectRows.length != 1) {
                $.messager.alert("系统提示", "只能编辑一条数据");
                return;
            }
            var row = selectRows[0];
            $("#dlg").dialog("open").dialog("setTitle", "修改成绩信息");
            $("#fm").form("load", row);  //自动填值
        }

        //删除成绩 按钮
        function destroyGrade() {
            //返回传送回来的集合 为JSON格式
            var selectedRows = $("#cjcx").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("未选数据！", "请选择数据！");
                return;
            }
            //封装成绩数据对象
            var ScoreObj =
                {
                    sno: "",
                    cno: "",
                    year: "",
                    semester: "",
                    chapter: "",
                    grade: ""
                }
            var a = JSON.parse("{\"title\":\"scores\",\"data\":[]}");

            for (var i = 0; i < selectedRows.length; i++) {
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
            var obj = JSON.stringify(a);  //把a这个json对象 转换成 json数组

            $.messager.confirm("系统提示", "确定删除" + selectedRows.length + "条数据？", function (r) {
                if (r) {
                    //第二个参数是传入参数    delIDs为deleteSnos result为servlet传来的jsonobject
                    $.post("scoreDeleteServlet", {'deleteSnos': obj}, function (result) {
                        //这个success是返回的参数，
                        if (result.success) {
                            $("#cjcx").datagrid("reload");
                            alert("成功删除" + result.delNums + "条数据");
                        }
                        else {
                            alert("delete not OK!");
                        }
                    }, "json");
                }
            });
        }
    </script>
</head>

<body>

<table id="cjcx" title="成绩查询" class="easyui-datagrid" style="width:auto;height:auto"
       url="scoreServlet"
<%--url="scoreServlet?tno=${sessionScope.teacher.tno}&subject=${sessionScope.teacher.subject}"--%>
       toolbar="#toolbar"
       rownumbers="true" fitColumns="true" singleSelect="false"
       pagination="true"
       fit="true">
    <thead>
    <tr>
        <th field="checkBox" checkbox="true"></th>
        <th field="sno" width="35">学号</th>
        <th field="cno" width="35">课程号</th>
        <th field="year" width="35">考试年份</th>
        <th field="semester" width="35">学期</th>
        <th field="chapter" width="35">单元</th>
        <th field="tno" width="35">批卷人</th>
        <th field="grade" width="35">成绩</th>
    </tr>
    </thead>
</table>

<div id="toolbar">
    <div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true"
           onclick="addTabs('添加成绩','teacher/addScorePage')">添加成绩</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="modifyGrade()">修改成绩</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyGrade()">删除成绩</a>
    </div>

    <div>
        <input type="hidden" id="teacherid" name="teacherid" value="${sessionScope.teacher.tno}"/>

        查询（学号）：<input type="text" id="chaxun" name="chaxun"/>

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

<div id="dlg" class="easyui-dialog" style="width: 400px;height: 280px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table>

            <tr>
                <td>学号</td>
                <td><input type="text" name="sno" id="fm_sno" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>课程号</td>
                <td><input type="text" name="cno" id="fm_cno" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>年份</td>
                <td><input type="text" name="year" id="fm_year" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>学期</td>
                <td><input type="text" name="semester" id="fm_semester" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>单元</td>
                <td><input type="text" name="chapter" id="fm_chapter" class="easyui-textbox"></td>
            </tr>
            <tr>
                <td>批卷人</td>
                <td><input type="text" name="tno" id="fm_tno" class="easyui-textbox"></td>
            </tr>

            <tr>
                <td>成绩</td>
                <td><input type="text" name="grade" id="fm_grade" data-options="required:true"
                           class="easyui-validatebox"></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>