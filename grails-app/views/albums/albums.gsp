<%--
  Created by IntelliJ IDEA.
  User: yi
  Date: 06/02/14
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Albums</title>

</head>

<body>

<div style="text-align: center">

    %{--<div class="col-lg-6 col-md-pull-8 col-md-offset-2 col-sm-pull-8 col-sm-offset-2 ">--}%
    <div class="col-lg-7  col-lg-offset-1  ">

        <div class="col-lg-4 ">
            %{--loop albums--}%
            <div class="frame ">
                <a href="#">
                    <p class="album-title">Album1</p>
                    %{--get first pic--}%
                    <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px"
                         class=" img-rounded"
                         alt="" width="90%"/>


                    <div>
                        %{--loop the pics 2 to 5--}%
                        <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px"
                             class=" img-rounded" alt="" width="20%"/>

                        <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px"
                             class=" img-rounded" alt="" width="20%"/>

                        <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px"
                             class=" img-rounded" alt="" width="20%"/>

                        <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px"
                             class=" img-rounded" alt="" width="20%"/>

                    </div>
                </a>

            </div>

        </div>

    </div>


    <div class="col-lg-2   ">
        <div class="col-lg-12 frame  ">

            <p class="album-title">Popular</p>
            <hr style="border-top: 1px solid #cccccc; margin-top:10px;margin-bottom: 10px;">

            %{--loop the popular pics --}%
            <a href="#">
                <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px" class=" img-rounded"
                     alt="" width="90%"/>

            </a>
            <a href="#">
                <img src="${resource(dir: 'images', file: 'me.jpg')}" style="margin-bottom: 5px" class=" img-rounded"
                     alt="" width="90%"/>

            </a>

        </div>

    </div>

</div>

</body>
</html>

<script type="text/javascript">
    document.ready(function () {
        $('#albums').addClass('active');
    });

</script>