
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Notes</title>
</head>
<body>
<div class="frame col-lg-4 col-lg-offset-4">


    <g:form method="POST" controller="photos" action="upload" enctype="multipart/form-data" class="form-group">
        <input type="file" name="uploadFile" required=""/>
        <input type="text" class="form-control" style="padding-left: 3px" placeholder="Album Name" required="" autofocus=""  name="albumName"/>
        <input type="text" style="padding-left: 3px" class="form-control" placeholder="Description"   name="desc"/>
        <input type="submit" value="Upload" />
    </g:form>

</div>

</body>
</html>