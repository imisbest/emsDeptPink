<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>emplist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/style.css"/>
</head>
<body>
<div id="wrap">
    <div id="top_content">
        <div id="header">
            <div id="rightheader">
                <p>
                    <%@ page import="java.text.SimpleDateFormat" %>
                    <%@ page import="java.util.Calendar" %>
                    <% String datetime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); /*//获取系统时间*/%><%=datetime%>
                    <br/> <br/>
                    <br/>
                </p>
            </div>
            <div id="topheader">
                <h1 id="title">
                    <a href="#">main</a>
                </h1>
            </div>
            <div id="navigation">
            </div>
        </div>
        <div id="content">
            <p id="whereami">
            </p>
            <h1>
                Welcome,${user.username}!
            </h1>
            <table class="table">
                <tr class="table_header">
                    <td>
                        ID
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Operation(删除部门员工一并删除)
                    </td>
                </tr>
                <c:forEach items="${depts}" var="p">
                    <tr class="row1">
                        <td>
                                ${p.id}
                        </td>
                        <td>
                                ${p.name}
                        </td>
                        <td>
                            <a href="${path}/d/delete?deptid=${p.id}"><input type="button" value="删除部门"
                                                                             onclick="return subFout()"></a>
                            <script type="text/javascript">
                                function subFout() {

                                    var b = window.confirm("请确认提交是否提交表单");
                                    if (b) {
                                        return true;
                                    } else {
                                        return false;
                                    }
                                }
                            </script>
                            &nbsp;<a href="${path}/d/updatefirst?deptid=${p.id}"><input type="button" value="更新部门"></a>&nbsp;<a
                                href="${path}/e/queryAndPage?deptid=${p.id}&currPage=1"><input type="button"
                                                                                               value="展示员工"></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <p>
                <input type="button" class="button" value="添加部门" onclick="location='${path}/dept/addDept.jsp'"/>
            </p>
        </div>
    </div>
    <div id="footer">
        <div id="footer_bg">
            ABC@126.com
        </div>
    </div>
</div>
</body>
</html>
