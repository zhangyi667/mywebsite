<%--
  Created by IntelliJ IDEA.
  User: yi
  Date: 06/02/14
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="mywebsite.Photos" contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Albums</title>

</head>

<body>

<div style="text-align: center">

    <div class="col-lg-7  col-lg-offset-1  ">
        <g:each in="${albums}" var="a">

            <div class="col-lg-4 ">
                %{--loop albums--}%
                <div class="frame ">
                    <g:link controller="photos" action="index" params="[albumName: a.value.albumName]" >
                        <p class="album-title">${a.value.albumName}</p>

                    %{--get first pic--}%
                        <img src='..${a.value.firstPic}' style="margin-bottom: 5px;border: solid white 1px;"

                             alt="" width="95%"/>


                        <div>
                        %{--loop the pics 2 to 5--}%

                            <g:if test="${a.value.smallPics[3]}">
                                <img src="../${a.value.smallPics[3]}" style="margin-bottom: 5px;border: solid white 1px;"
                                      alt="" width="22%"/>
                            </g:if>  <g:else>
                            <img src="../images/photos/default.jpg" style="margin-bottom: 5px;border: solid white 1px;"
                                  alt="" width="22%"/>
                        </g:else>

                            <g:if test="${a.value.smallPics[2]}">
                                <img src="../${a.value.smallPics[2]}" style="margin-bottom: 5px;border: solid white 1px;"
                                     alt="" width="22%"/>
                            </g:if>  <g:else>
                            <img src="../images/photos/default.jpg" style="margin-bottom: 5px"
                                  alt="" width="22%"/>
                        </g:else>

                            <g:if test="${a.value.smallPics[1]}">
                                <img src="../${a.value.smallPics[1]}" style="margin-bottom: 5px;border: solid white 1px;"
                                     alt="" width="22%"/>
                            </g:if>  <g:else>
                            <img src="../images/photos/default.jpg" style="margin-bottom: 5px"
                                  alt="" width="22%"/>
                        </g:else>



                            <g:if test="${a.value.smallPics[0]}">
                                <img src="../${a.value.smallPics[0]}" style="margin-bottom: 5px;border: solid white 1px;"
                                   alt="" width="22%"/>
                            </g:if>  <g:else>
                            <img src="../images/photos/default.jpg" style="margin-bottom: 5px"
                                 alt="" width="22%"/>
                        </g:else>

                        </div>
                    </g:link>

                </div>

            </div>
        </g:each>

    </div>


    <div class="col-lg-2   ">
        <div class="col-lg-12 frame  ">

            <p class="album-title">Popular</p>
            <hr style="border-top: 1px solid #cccccc; margin-top:10px;margin-bottom: 10px;">

        %{--loop the popular pics --}%

            <g:each in="${popular}" var="p">

                <a href="#" data-toggle="modal" data-target="#myModal${p.id}">
                    <img src='..${p.location}'  style="margin-bottom: 5px"  class=" img-rounded"
                         alt="" width="100%"/>
                </a>


                <!-- Modal -->
                <div class="modal fade" id="myModal${p.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-body">
                                <img src='..${p.location}'   class=" img-rounded"
                                     alt="" width="100%"/>
                            </div>%{--modal-body--}%

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>%{--modal-footer--}%
                        </div>
                    </div>
                </div>

            </g:each>

            %{--<a href="#">--}%
                %{--<img src="${resource(dir: 'images', file: 'photos/me.jpg')}" style="margin-bottom: 5px"--}%
                     %{--class=" img-rounded"--}%
                     %{--alt="" width="90%"/>--}%

            %{--</a>--}%
            %{--<a href="#">--}%
                %{--<img src="${resource(dir: 'images', file: 'photos/me.jpg')}" style="margin-bottom: 5px"--}%
                     %{--class=" img-rounded"--}%
                     %{--alt="" width="90%"/>--}%

            %{--</a>--}%

        </div>

    </div>

</div>

<script type="text/javascript">

    $('#albums').addClass('active');


</script>

</body>
</html>

