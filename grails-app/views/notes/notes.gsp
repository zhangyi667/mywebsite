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
    <title>Notes</title>
</head>
<body>
    %{--loop the articles--}%
    <g:if test="${flash.message}">
        <div>
            <p>${flash.message}</p>
        </div>

    </g:if>

    <g:each in="${blogs}" var="b">
        <div class="frame col-lg-8  col-lg-offset-2">
            <div >
                <h3 class="left">${b.value.title}</h3>  %{--Title--}%
                <p class="right"><small>${b.value.createTime}</small></p>
                <div >
                    %{--<p class="left">This is the first blog.</p>--}%
                    <p class="left">
                        ${b.value.log}
                    </p>

                    <p class="left">...</p>

                </div>

                <g:if test="${short}">

                    <g:link controller="notes" action="index" params="['id':b.key]" >

                        <div>
                            <p class="right">More</p>

                        </div>
                    </g:link>
                </g:if>

            </div>
            <hr>

        </div>

    </g:each>



<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg " data-toggle="modal" data-target="#myModal">
    Upload Photos
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Upload files</h4>
            </div>
            <div class="modal-body">
                <g:uploadForm method="POST" controller="notes" action="upload" enctype="multipart/form-data" >
                    <input  type="file" name="uploadFile" required="" style="margin-bottom: 5px"/>
                %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
                    <input type="text" class="form-control" style="padding-left: 3px" placeholder="title" required="" autofocus=""  name="title"/>
                    <input type="submit" value="Upload" />
                </g:uploadForm>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

%{--<script type="text/javascript">--}%
    %{--$('#notes').addClass('active')--}%
    %{--function textAreaScrollBottom(id) {--}%
        %{--$(id).scrollTop = $(id).scrollHeight;--}%
    %{--}--}%

%{--</script>--}%

%{--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js">--}%


%{--</script>--}%

</body>
</html>