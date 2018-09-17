<%--
  Created by IntelliJ IDEA.
  User: hkx
  Date: 2018/9/11
  Time: 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${root }/static/js/jquery-1.12.4.min.js"></script>
    <script src="${root }/static/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="${root }/static/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="box">
        <form class="form-horizontal" id="form1">
            <div class="form-group">
                <label for="hire" class="col-sm-2 control-label">时间</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" id="hire" placeholder="时间提交" name="birthday" value="2018-09-11"/>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="button" class="btn btn-default" id="submitBtn">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script>
    $(function () {
        $("#submitBtn").click(function () {
            $.post("${root}/demo/getDate",$("#form1").serializeArray(),function (data) {
                if(data.success){
                   var list = data.data;
                }
            });
        });

    });




</script>
</html>
