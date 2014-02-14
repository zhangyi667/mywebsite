
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Photos</title>
</head>
<body>





    <div class="col-lg-12  col-lg-offset-1">

        <div class="col-lg-9 1 frame ">
            <g:if test="${album}">
                <h4>Album: ${album}</h4>
            </g:if>


        </div>
        %{--loop albums--}%
           <g:each in="${photos}" var="p">
               <div class="col-lg-3 frame-container">


                         <g:link controller="photos" action="singlePic" params="['id':p.id, 'album':p.albumName]">
                             <img  src='..${p.location}'
                                   alt="" width="100%"/>
                             <div class="frame-description">
                                 <p class="right"> ${p.photoDesc} </p>
                                 <span class="white small clear-right right"> ${p.createTime}</span>
                                 <span class="clear-right"></span>
                             </div>
                         </g:link>








               </div>



           </g:each>





    </div>



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
                    <g:uploadForm method="POST" controller="photos" action="upload" enctype="multipart/form-data" >
                        <input  type="file" name="uploadFile" required="" style="margin-bottom: 5px"/>
                        %{--<button type="file" class="btn btn-primary " name="uploadFile" required="" style="margin-bottom: 5px;float: left">Choose File </button>--}%
                        <input type="text" class="form-control" style="padding-left: 3px" placeholder="Album Name" required="" autofocus=""  name="albumName"/>
                        <input type="text" style="padding-left: 3px" class="form-control" placeholder="Description"   name="desc"/>
                        <input type="submit" value="Upload" />
                    </g:uploadForm>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>







</body>
</html>