<%@ page pageEncoding="UTF-8" contentType="text/html; charset=utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%
    request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>emplist</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <link href="../css/common.css" type="text/css" rel="stylesheet"/>
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
                Welcome (${user.username})!
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
                        Salary
                    </td>
                    <td>
                        Age
                    </td>
                    <td>
                        Bir
                    </td>
                    <td>
                        Dept
                    </td>
                    <td>
                        Operation(处理删除的友情提醒)
                    </td>
                </tr>
                <c:forEach items="${empList}" var="p">
                    <tr class="row1">
                        <td>
                                ${p.id}
                        </td>
                        <td>
                                ${p.name}
                        </td>
                        <td>
                                ${p.salary}
                        </td>
                        <td>
                                ${p.age}
                        </td>
                        <td>
                            <f:formatDate value="${p.bir}" pattern="yyyy/MM/dd"/>

                        </td>
                        <td>
                                ${p.dept.name}
                        </td>
                        <td>
                            <a href="${path}/e/delete?id=${p.id}"> <input type="button" value="删除员工"
                                                                          onclick="return subFout()"></a>&nbsp;
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
                            <a href="${path}/e/updatefirst?id=${p.id}"> <input type="button" value="更新员工"></a>
                        </td>
                    </tr>
                </c:forEach>

            </table>
            <%-- <div class="pagination">
                 <span class="firstPage">&nbsp;</span> <span class="previousPage">&nbsp;</span>
                 <span class="currentPage">1</span> <a
                     href="javascript:$.pageSkip(2);">2</a> <a
                     href="javascript:$.pageSkip(3);">3</a> <span class="pageBreak">...</span>
                 <a class="nextPage" href="javascript: $.pageSkip(2);">&nbsp;</a>
                 <a class="lastPage" href="javascript: $.pageSkip(6);">&nbsp;</a>
                 <span class="pageSkip"> 共6页 到第<input id="pageNumber"
                                                      name="pageNumber" value="1" maxlength="9"
                                                      onpaste="return false;">页
                                 <button type="submit">&nbsp;</button>
                         </span>(请在全部功能完成后在处理分页)
             </div>--%>
            <div>
                <!--分页导航开始-->
                <!-- //首页 -->
                <center style="text-decoration: none">
                    <a
                            href="${path }/e/queryAndPage?currPage=1" style="text-decoration: none">
                        <input type="button" value="首页"> &nbsp;&nbsp;&nbsp;&nbsp;
                    </a>

                    <!-- //上一页 -->

                    <a
                            href="${path }/e/queryAndPage?currPage=${currPage-1}" style="text-decoration: none">
                        <input type="button" value="上一页"> &nbsp;&nbsp;&nbsp;&nbsp;
                    </a>

                    <!-- //当前页 -->

                    <%-- <c:forEach begin="1" end="${countPage}" var="i"> --%>
                    <a
                            href="${path }/e/queryAndPage?currPage=${currPage}"
                            style="text-decoration: none">当前第${currPage}/${countPage}页</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <%-- </c:forEach> --%>


                    <!-- //下一页 -->

                    <a
                            href="${path }/e/queryAndPage?currPage=${currPage+1}" style="text-decoration: none">
                        <input type="button" value="下一页">&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>

                    <!-- //最后一页 -->
                    <a href="${path }/e/queryAndPage?currPage=${countPage}" style="text-decoration: none">
                        <input type="button" value="尾页">&nbsp;&nbsp;&nbsp;&nbsp;
                    </a>
                    <!--分页导航结束-->
            </div>
            <p>
                <a href="${path}/e/addfirst"> <input type="button" class="button" value="添加员工"/></a>
                <a href="${path}/d/showAll"><input type="button" value="返回上一层"></a>
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
