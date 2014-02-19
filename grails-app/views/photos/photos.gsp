
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











</body>
</html>