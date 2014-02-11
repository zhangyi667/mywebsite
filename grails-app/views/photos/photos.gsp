
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Photos</title>
</head>
<body>
<div style="text-align: center">

    <div class="col-lg-9  col-lg-offset-1  ">
        %{--loop albums--}%
           <g:each in="${photos}" var="p">
               <div class="col-lg-3 ">
                   <div class="frame ">
                       <p class="album-title">${p}</p>



                       <img  src='../${p.location}' style="margin-bottom: 5px"
                       class=" img-rounded"
                       alt="" width="90%"/>




                   </div>


               </div>

           </g:each>





    </div>




</div>

<!-- Button trigger modal -->
<button class="btn btn-primary btn-lg invisible" data-toggle="modal" data-target="#myModal">
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
                <g:form method="POST" controller="photos" action="upload" enctype="multipart/form-data" class="form-group">
                    <input type="file" name="uploadFile" required=""/>
                    <input type="text" class="form-control" style="padding-left: 3px" placeholder="Album Name" required="" autofocus=""  name="albumName"/>
                    <input type="text" style="padding-left: 3px" class="form-control" placeholder="Description"   name="desc"/>
                    <input type="submit" value="Upload" />
                </g:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>