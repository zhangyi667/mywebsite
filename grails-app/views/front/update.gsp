<%--
  Created by IntelliJ IDEA.
  User: yi
  Date: 07/02/14
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
</head>
<body >
%{--loop the articles--}%
<div class=" col-lg-4  col-lg-offset-4">

    <div class="frame">
        <p>Upload photos</p>
        <g:uploadForm method="POST" controller="photos" action="upload" enctype="multipart/form-data" >
            <input  type="file" name="uploadFile" required="" style="margin-bottom: 5px"/>
        %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="Album Name" required="" autofocus=""  name="albumName"/>
            <input type="text" style="padding-left: 3px" class="form-control" placeholder="Description"   name="desc"/>
            <input type="submit" value="Upload" />
        </g:uploadForm>
    </div>


    <div class="frame" >
        <p>Upload Notes</p>
        <g:uploadForm method="POST" controller="notes" action="upload" enctype="multipart/form-data" >
            <input  type="file" name="uploadFile" required="" style="margin-bottom: 5px"/>
        %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="title" required="" autofocus=""  name="title"/>
            <input type="submit" value="Upload" />
        </g:uploadForm>
    </div>

    <div class="frame">
        <p>Upload Self Info</p>
        <g:uploadForm method="POST" controller="front" action="upload" enctype="multipart/form-data" >
        %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="signature" required="" autofocus=""  name="signature"/>
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="email" required=""  name="email"/>
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="twitter" required=""  name="twitter"/>
            <input  type="file" name="uploadFile" required="" style="margin-bottom: 5px"/>
            <input type="submit" value="Upload" />
        </g:uploadForm>
    </div>

    <div class="frame">
        <p>Change Self Info Status</p>
        <g:uploadForm method="POST" controller="front" action="changeStatus" enctype="multipart/form-data" >
        %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="signature"  autofocus=""  name="signature"/>
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="email"  name="email"/>
            <input type="text" class="form-control" style="padding-left: 3px" placeholder="twitter"  name="twitter"/>
            <input  type="file" name="uploadFile" style="margin-bottom: 5px"/>
            <input type="submit" value="Upload" />
        </g:uploadForm>
    </div>

</div>





</body>
</html>