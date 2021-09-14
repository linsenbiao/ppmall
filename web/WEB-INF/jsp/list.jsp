<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/8/4 0004
  Time: 下午 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("way",request.getContextPath());
%>
<html>
<head>
    <title>Title</title>
    <%--    引入jquery--%>
        <script type="text/javascript" src="${way}/static/jquery/jquery-3.5.1.min.js"></script>
    <%--    引入样式--%>
        <link href="${way}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="${way}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Dept</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.id}</td>
                            <td>${emp.name}</td>
                            <td>${emp.gender}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department.name}</td>
                            <td>
                                <button class="btn btn-primary btn-xs">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-xs">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                当前第 ${pageInfo.pageNum} 页,全 ${pageInfo.pages} 页, ${pageInfo.total} 条记录
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${way}/emps?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${way}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                            <c:if test="${page == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page}</a></li>
                            </c:if>
                            <c:if test="${page != pageInfo.pageNum}">
                                <li><a href="${way}/emps?pn=${page}">${page}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${way}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${way}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
