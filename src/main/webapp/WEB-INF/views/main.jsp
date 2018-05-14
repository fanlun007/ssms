<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        pageContext.setAttribute("app_path", request.getContextPath());
    %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

  <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="${app_path}/jquery-easyui-1.5.3/themes/icon.css">
  <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.min.js"></script>
  <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="${app_path}/jquery-easyui-1.5.3/locale/easyui-lang-zh_CN.js"></script>
  <script type="text/javascript">
  	$(function(){
        var treedata=[{
            text:"教师后台",
            children:[{
                text:"成绩管理",
                attributes:{
                    url:"teacher/cjcx"
                }
            },{
                text:"个人信息查询",
                attributes:{
                    //这里设置连接
                    url:"/StudentInfo/cjcx.jsp"
                }
            }]
        }];
        
        $("#tree").tree({
            data:treedata,
            lines:true,
            onClick:function(node){
                if(node.attributes){
                    addTab(node.text,node.attributes.url);
                }
            }
        });
			
        function addTab(text,url){
            if ($('#tabs').tabs('exists', text)){
                $('#tabs').tabs('select', text);
            }
            else{
                //这里使用iframe进行显示
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%"></iframe>';
                $("#tabs").tabs('add',{
                title:text,
                closable:true,
                content:content
                });
            }

        }
    });
    /**
     * 刷新指定的tab里面的数据
     * @param title 选项卡标题
     * @param refreshTabFunc  自定义的刷新方法(再各个页面具体实现)
     */

    function refreshTabData(title, refreshGridFunc) {
        if ($('#tabs').tabs('exists', title)){
            $('#tabs').tabs('exists', title);
            typeof refreshGridFunc === 'function' && refreshGridFunc.call();
        }
    }

    function logout() {
        $.messager.confirm("系统提示","确定退出",function (r) {
            if(r){
                window.location.href="${pageContext.request.contextPath}/logoutServlet";
            }
        })
    }
  </script>

</head>

<body class="easyui-layout">

	<div region="north" style="height:80px; background-color:#E0EDFF">
        <h1 align="center">学生成绩管理系统</h1>
        <div align="right">
            <a>当前账户:</a>${sessionScope.teacher.tno}
            <a href="javascript:logout()">注销</a>
        </div>
    </div>
    
    <div region="center">
    	<!--这里是tabs -->
    	<div id="tabs" class="easyui-tabs" fit="true" border="false" >
        	<div title="首页"></div>
        </div>
    </div>
    
    <div region="west" style="width:150px" title="导航菜单" split="true">
    	<!--这里是一个列表，id为tree -->
    	<ul id="tree">
        </ul>
    </div>
    
    <div region="south" style="height:25px;" align="center">学生成绩管理系统</div>
	
</body>
</html>