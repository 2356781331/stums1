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
        <form action="${root }/file/submitUpload" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="exampleInputEmail1">Email</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Email" name="email">
            </div>
            <div class="form-group">
                <label for="exampleInputFile">File input</label>
                <input type="file" id="exampleInputFile" name="file1">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>

    </div>
</div>
</body>
<script>



</script>
</html>
