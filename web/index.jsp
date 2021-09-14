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
            <button class="btn btn-primary" id="emp_add" save-status="success">新增</button>
            <button class="btn btn-danger" id="delete_all">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll">
                        </th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Dept</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6" id="page_info">

        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-6" id="page_nav">

        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="inputEmpName" class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="inputEmpName" placeholder="name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmpEmail" class="col-sm-2 control-label">邮箱：</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="inputEmpEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别：</label>
                            <div class="radio-inline">
                                <label>
                                    <input type="radio" name="gender" value="男" checked="checked">男
                                </label>
                            </div>
                            <div class="radio-inline">
                                <label>
                                    <input type="radio" name="gender" value="女">女
                                </label>
                            </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="did">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="updateEmpName_static" class="col-sm-2 control-label">姓名：</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="updateEmpName_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateEmpEmail" class="col-sm-2 control-label">邮箱：</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="updateEmpEmail" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别：</label>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="gender" value="男" id="man">男
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="gender" value="女" id="woman">女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="did">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_save">更新</button>
            </div>
        </div>
    </div>
</div>
    <script type="text/javascript">

        var currentPage;

        $(function (){
            topage(1);
        })

        function topage(pn){
            $.ajax({
                url:"${way}/emps",
                data:"pn="+pn,
                type:"GET",
                success:function (result){
                    //console.log(result);
                    //解析并显示员工数据，分页信息
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            })
        }

        function build_emps_table(result){
            $("#emps_table tbody").empty();
            var emps = result.map.pageInfo.list;
            $.each(emps,function (index,item){
                var checkbox_td = $("<td><input type='checkbox' class='checkone'></td>");
                var empid_td = $("<td></td>").append(item.id);
                var empname_td = $("<td></td>").append(item.name);
                var empgender_td = $("<td></td>").append(item.gender);
                var empemail_td = $("<td></td>").append(item.email);
                var empdept_td = $("<td></td>").append(item.department.name);
                var editbtn_td = $("<button></button>").addClass("btn btn-primary btn-xs edit-btn")
                                .append($("<span></span>")).addClass("glyphicon glyphicon-pencil")
                                .append("编辑")
                //获取对应id
                                .attr("edit-id",item.id);
                var deletebtn_td = $("<button></button>").addClass("btn btn-danger btn-xs delete-btn")
                                .append($("<span></span>")).addClass("glyphicon glyphicon-trash")
                                .append("删除");
                    deletebtn_td.attr("delete-id",item.id);
                var opera_td = $("<td></td>").append(editbtn_td).append(" ").append(deletebtn_td);
                $("<tr></tr>")
                    .append(checkbox_td)
                    .append(empid_td)
                    .append(empname_td)
                    .append(empgender_td)
                    .append(empemail_td)
                    .append(empdept_td)
                    .append(opera_td)
                    .appendTo("#emps_table tbody");
            });
        }

        function build_page_info(result){
            $("#page_info").empty();
            $("#page_info").append("当前第 "+result.map.pageInfo.pageNum+" 页,全 "+result.map.pageInfo.pages+" 页, "+result.map.pageInfo.total+" 条记录");
            currentPage = result.map.pageInfo.pageNum;
        }

        function build_page_nav(result){
            $("#page_nav").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            var firstpage = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prepage = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
            if(result.map.pageInfo.hasPreviousPage == false){
                firstpage.addClass("disabled");
                prepage.addClass("disabled");
            }

            firstpage.click(function (){
                topage(1);
            })
            prepage.click(function (){
                topage(result.map.pageInfo.prePage);
            })

            var nextpage = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
            var lastpage = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            if(result.map.pageInfo.hasNextPage == false){
                nextpage.addClass("disabled");
                lastpage.addClass("disabled");
            }

            nextpage.click(function (){
                topage(result.map.pageInfo.nextPage);
            })
            lastpage.click(function (){
                topage(result.map.pageInfo.pages);
            })

            ul.append(firstpage).append(prepage);

            $.each(result.map.pageInfo.navigatepageNums,function (index,item){
                var showpage = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
                if(result.map.pageInfo.pageNum == item){
                    showpage.addClass("active");
                }
                showpage.click(function (){
                    topage(item);
                })
                ul.append(showpage);
            })

            ul.append(nextpage).append(lastpage);

            var nav = $("<nav></nav>").append(ul);

            nav.appendTo("#page_nav");
        }

        //清除表单数据及样式
        function reset_form(ele){
            //[0]表示调用dom，jquery中没有reset方法
            $(ele)[0].reset();
            $(ele).find("*").removeClass("has-success has-error");
            $(ele).find(".help-block").text("");
        }
        //点击新增按钮弹出模态框
        $("#emp_add").click(function (){
            //清除表单数据及样式（完整重置）
            reset_form("#addModal form");
            //发送ajax请求，获取部门信息，显示在下拉列表中
            getDepts("#addModal select");
            //弹出模态框
            $("#addModal").modal({
                backdrop:"static"
            });
        });

        //点击编辑按钮弹出模态框
        //创建按钮前就已经绑定了click，所以绑定不上
        //可在创建按钮的时候绑定，click.live（）
        //jquery新版没有live，用on替代
        $(document).on("click",".edit-btn",function (){
            //获取部门信息
            getDepts("#updateModal select");
            //获取员工信息
            getEmp($(this).attr("edit-id"));
            //把员工id传给模态框的更新按钮
            $("#emp_update_save").attr("edit-id",$(this).attr("edit-id"));
            //弹出模态框
            $("#updateModal").modal({
                backdrop:"static"
            });
        })

        //单个删除
        $(document).on("click",".delete-btn",function (){
            var empName = $(this).parents("tr").find("td:eq(2)").text();

            if(confirm("确认删除【"+empName+"】吗？")){
                //confirm:确认返回true，取消返回false
                var delete_id = $(this).attr("delete-id");
                $.ajax({
                    url:"${way}/delete/"+delete_id,
                    type:"DELETE",
                    success:function (result){
                        alert(result.msg);
                        topage(currentPage);
                    }
                })
            }
        })

        //全选全不选
        $("#checkAll").click(function (){
            //attr获取checked是undefined
            //attr获取自定义属性值
            //prop修改和获取dom原生属性值
            $(".checkone").prop("checked",$(this).prop("checked"));
        })

        //当一页checked都选中时，全选框也被选中，只要有其中一个未选中，全选框都是未选中
        $(document).on("click",".checkone",function (){
            var flag = $(".checkone:checked").length == $(".checkone").length;
            $("#checkAll").prop("checked",flag);
        })

        //批量删除
        $("#delete_all").click(function (){
            var empNames = "";
            var empids = "";
            $.each($(".checkone:checked"),function (){
                empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
                empids += $(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            //去掉多余的逗号
            empNames = empNames.substring(0,empNames.length-1);
            if(confirm("确认删除【"+empNames+"】吗？")){
                $.ajax({
                    url:"${way}/delete/"+empids,
                    type:"DELETE",
                    success:function (result){
                        alert(result.msg);
                        $("#checkAll").prop("checked",false);
                        topage(currentPage);
                    }
                })
            }
        })

        function getEmp(id){
            $.ajax({
                url:"${way}/emp/"+id,
                type:"GET",
                success:function (result){
                    var empData = result.map.emp;
                    console.log(empData.gender == "男");
                    console.log(empData.gender == "女");
                    $("#updateEmpName_static").text(empData.name);
                    $("#updateEmpEmail").val(empData.email);
                    if(empData.gender == "男"){
                        $("#woman").removeClass("checked");
                        $("#man").attr("checked","checked");
                    }else{
                        $("#man").removeClass("checked");
                        $("#woman").attr("checked","checked");
                    }
                    $("#updateModal select").val(empData.did);
                }
            })
        }

        function getDepts(ele){
            $(ele).empty();
            $.ajax({
                url:"${way}/depts",
                type: "GET",
                success:function(result){
                    //console.log(result);
                    $.each(result.map.depts,function (){
                        var option = $("<option></option>").append(this.name).attr("value",this.id);
                        option.appendTo(ele);
                    })
                }
            })
        }

        //规范
        function emp_Veri_info(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");

            $(ele).parent().addClass(status);
            $(ele).next("span").text(msg);
        }

        //校验
        function Verification(){
            var empname = $("#inputEmpName").val();
            var resname = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
            if(!resname.test(empname)){
                emp_Veri_info("#inputEmpName","has-error","用户名应为6-16位字符或2-5位中文!");

                return false;
            }
            else{
                emp_Veri_info("#inputEmpName","has-success","");

            }

            var empemail = $("#inputEmpEmail").val();
            var reaemail = 	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            if(!reaemail.test(empemail)){
                emp_Veri_info("#inputEmpEmail","has-error","邮箱格式不正确！");
                return false;
            }
            else{
                emp_Veri_info("#inputEmpEmail","has-success","");
            }
            return true;
        }

        $("#inputEmpName").change(function (){
            //发送ajax请求校验用户名是否可用
            var empname = this.value;
            $.ajax({
                url:"${way}/check",
                type:"POST",
                data:"empname="+empname,
                success:function (result){
                    if(result.code == 100){
                        emp_Veri_info("#inputEmpName","has-success","用户名可用")
                        $("#emp_add").attr("save-status","success")
                    }
                    else{
                        emp_Veri_info("#inputEmpName","has-error",result.map.va_msg)
                        $("#emp_add").attr("save-status","error")
                    }
                }
            })
        })

        //点击保存员工
        $("#emp_add_save").click(function (){
            //数据提交给服务器之前先校验
            // if(!Verification()){
            //     return false;
            // };
            //1、判断之前的ajax用户名校验是否成功。如果成功。
            // if($(this).attr("ajax-va")=="error"){
            //     return false;
            // }
                $.ajax({
                    url:"${way}/add",
                    data: $("#addModal form").serialize(),
                    type:"POST",
                    success:function (result){
                        if(result.code == 100){
                            //员工保存成功
                            alert("保存成功！")
                            //关闭模态框
                            $("#addModal").modal('hide');
                            //跳到最后一页
                            topage(9999);
                        }
                        else{
                            if(undefined != result.map.errorfields.email){
                                emp_Veri_info("#inputEmpEmail","has-error",result.map.errorfields.email)
                            }
                            if(undefined != result.map.errorfields.name){
                                emp_Veri_info("#inputEmpName","has-error",result.map.errorfields.name)
                            }

                        }
                    }
                })
        })
        //点击更新员工
        $("#emp_update_save").click(function (){
            var empemail = $("#updateEmpEmail").val();
            var reaemail = 	/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
            if(!reaemail.test(empemail)){
                emp_Veri_info("#updateEmpEmail","has-error","邮箱格式不正确！");
                return false;
            }
            else{
                emp_Veri_info("#updateEmpEmail","has-success","");
            }

            $.ajax({
                url:"${way}/emp/"+$(this).attr("edit-id"),
                type:"POST",
                data:$("#updateModal form").serialize()+"&_method=PUT",
                success:function (result){
                    //alert(result.msg);
                    $("#updateModal").modal("hide");
                    topage(currentPage);
                }
            })
        })
    </script>
</body>
</html>
