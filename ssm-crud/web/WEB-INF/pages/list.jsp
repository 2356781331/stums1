<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("root", request.getContextPath());
    %>
    <!-- web路径：
    不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
    以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
            http://localhost:3306/crud
     -->
    <script type="text/javascript" src="${root }/static/js/jquery-1.12.4.min.js"></script>
    <script src="${root }/static/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${root }/static/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%--==========员工添加模态框===========--%>
<div class="modal fade" id="emp_add_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empSex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="sex_2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control col-sm-6" name="dId" id="depts_add_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<%--==========员工修改模态框===========--%>
<div class="modal fade" id="emp_update_model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="emp_update_Name"
                                   placeholder="empName" readonly>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="update_email" placeholder="email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empSex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="update_sex_1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="empSex" id="update_sex_2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control col-sm-6" name="dId" id="depts_update_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<%--========================================--%>
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th><input type="checkbox" id="check_all"/></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list }" var="emp">
                    <tr>
                        <td><input type="checkbox" class="checke_box"/></td>
                        <td>${emp.empId }</td>
                        <td>${emp.empName }</td>
                        <td>${emp.empSex}</td>
                        <td>${emp.email }</td>
                        <td>${emp.dept.deptName }</td>
                        <td>
                            <button class="btn btn-primary btn-sm edit " edit_id=${emp.empId}>
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>
                                编辑
                            </button>
                            <button class="btn btn-danger btn-sm delete" delete_id=${emp.empId}>
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <!-- 显示分页信息 -->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录
        </div>
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${root }/findAllemp?pageno=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <li><a href="${root }/findAllemp?pageno=${pageInfo.pageNum-1}"
                               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        </a></li>
                    </c:if>


                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${page_Num }</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${root }/findAllemp?pageno=${page_Num }">${page_Num }</a></li>
                        </c:if>

                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage }">
                        <li><a href="${root }/findAllemp?pageno=${pageInfo.pageNum+1 }"
                               aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                        </a></li>
                    </c:if>
                    <li><a href="${root }/findAllemp?pageno=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>
</html>
<script>

    //弹出添加员工模态框
    $(function () {
        $("#emp_add_btn").click(function () {

            $('#emp_add_model form')[0].reset();
            $('#emp_add_model form div').removeClass("has-error has-success");
            $('#emp_add_model form').find(".help-block").text("");
            getDepts("#depts_add_select");
            $('#emp_add_model').modal({
                backdrop: 'static'
            });
        });

        //获取所有的部门显示到下拉列表
        function getDepts(ele) {
            $(ele).empty();
            var url = "${root}/getAllDepts";
            $.get(url, null, function (result) {
                $.each(result, function () {
                    //<option value="1">开发部</option>
                    var one = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    $(ele).append(one);
                })
            })
        }

        //保存提交emp
        $("#emp_save_btn").click(function () {
            //保存前先做字段格式验证
            if ($("#email").attr("isUse") == "yes" && $("#empName").attr("isUse") == "yes") {
                var url = "${root}/addEmp";
                var data = $("#emp_add_model form").serialize();
                $.post(url, data, function (result) {
                    alert("添加成功");
                    $('#emp_add_model').modal('hide');
                    window.location.reload();
                });
            }
        });
        $("#email").change(function () {
            var email = $("#email").val();
            var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regemail.test(email)) {
                updataclass("#email", "fail", "邮箱格式不对");
                $("#email").attr("isUse", "no");
            } else {
                updataclass("#email", "success", "邮箱可用");
                $("#email").attr("isUse", "yes");
            }
        });
        $("#empName").change(function () {
            var empName = $("#empName").val();
            var regemp = /(^[a-z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regemp.test(empName)) {
                updataclass("#empName", "fail", "用户名为6-16位字符或2-5位中文");
                $("#empName").attr("isUse", "no");
                return false;
            } else {
                //如果用户名格式正确,则验证是否重复
                var url = "${root}/findEmpByname";
                var data = {"empName": $("#empName").val()};
                $.post(url, data, function (re) {
                    if (re == "success") {
                        updataclass("#empName", "success", "用户名可用");
                        $("#empName").attr("isUse", "yes");
                    } else {
                        updataclass("#empName", "fail", "用户名重复");
                        $("#empName").attr("isUse", "no");
                    }
                });
            }

        });
        //弹出更新员工模态框
        $(".edit").click(function () {
            //获取部门信息
            getDepts("#depts_update_select");
            //获取需要修改员工的信息
            getEmpById($(this).attr("edit_id"));
            //给更新按钮绑定主键id
            $("#emp_update_btn").attr("btnid",$(this).attr("edit_id"));
            //弹出框
            $('#emp_update_model').modal({
                backdrop: 'static'
            });
        });
        //获取需要修改员工的信息
        function getEmpById(id) {
            var url="${root}/getEmp/"+id;
            $.get(url,null,function (re) {
                $("#emp_update_Name").val(re.empName);
                $("#update_email").val(re.email);
                $("#emp_update_model input[type=radio]").val([re.empSex]);
                $("#emp_update_model select").val([re.dId]);

            });
        }
        //修改员工界面增加邮箱格式验证
        $("#update_email").change(function () {
            var email = $("#update_email").val();
            var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regemail.test(email)) {
                updataclass("#update_email", "fail", "邮箱格式不对");
                $("#update_email").attr("isUse", "no");
            } else {
                updataclass("#update_email", "success", "邮箱可用");
                $("#update_email").attr("isUse", "yes");
            }
        });
        //点击更新按钮更新数据
        $("#emp_update_btn").click(function () {
            if ($("#update_email").attr("isUse") == "yes"){
               $.ajax({
                   url:"${root}/updateEmp/"+$(this).attr("btnid"),
                   type:"PUT",
                   data:$('#emp_update_model form').serialize(),
                   success:function (re) {
                       alert("更新成功!");
                       $('#emp_update_model').modal("hide");
                       window.location.reload();
                   }
               });
            }
        });
        //验证用户名和邮箱,显示不同风格
        function updataclass(ele, staus, msg) {
            $(ele).parent().removeClass("has-error has-success");
            if (staus == "fail") {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            } else if (staus == "success") {
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }
        }
      //单个删除
        $(".delete").click(function () {
            var empName=$(this).parents("tr").find("td:eq(2)").text();
            if(confirm("确定删除"+empName+"吗?")){
                $.ajax({
                    url:"${root}/deleteEmp/"+$(this).attr("delete_id"),
                    type:"DELETE",
                    success:function (re) {
                        alert("删除成功");
                        $('#emp_update_model').modal("hide");
                        window.location.reload();
                    }
                });
            }
        });
        //批量删除
          //全选/全不选
         $("#check_all").click(function () {
             //alert($(this).prop("checked"))
             $(".checke_box").prop("checked",$(this).prop("checked"));
         });
        $(".checke_box").click(function () {
           var flag= $(".checke_box").length==$(".checke_box:checked").length;
            $("#check_all").prop("checked",flag);
        });
        $("#emp_del_btn").click(function () {
            var ids="";
            var empNames="";
           $.each($(".checke_box:checked"),function () {
               ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
               empNames+=$(this).parents("tr").find("td:eq(2)").text()+","
           });
           ids=ids.substring(0,ids.length-1);
           empNames=empNames.substring(0,empNames.length-1);
           if(confirm("确认删除"+empNames+"吗?")){
               $.ajax({
                   url:"${root}/deleteEmp/"+ids,
                   type:"DELETE",
                   success:function () {
                       alert("删除成功");
                       $('#emp_update_model').modal("hide");
                       window.location.reload();
                   }
               });
           }
        });
    });
</script>