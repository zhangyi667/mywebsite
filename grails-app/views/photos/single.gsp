
<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Photos</title>
</head>
<body>
<div style="text-align: center">

    <div class="col-lg-10  col-lg-offset-1  ">


                    <img  src="../..${pic.location}"    class="img-thumbnail"
                          alt="" width="100%"/>
                    %{--<div class="frame-description">--}%
                        %{--<p class="right"> ${pic.photoDesc} </p>--}%
                        %{--<span class="white small clear-right right"> ${pic.createTime}</span>--}%
                        %{--<span class="clear-right"></span>--}%
                    %{--</div>--}%
        <a  href="#" data-slide="next" >
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>

        <a  href="#" onclick="getPic('${pic.id}','next')" >
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>






        <script type="text/javascript">
            function getPic(id,request){


                var theurlAdd = '../singlePic?id='+id+'&'+request;


                //        $(targetIMG).attr('src', '../images/spinner.gif')
                //        setTimeout(function () {
                //            $(targetIMG).attr('src', '../googleauth/qrcode?sn=' + imgID)
                //        }, 500)

                $.ajax({
                    url: theurlAdd,
                    dataType: "json"
                }).done(function (response) {

                            if (response.error == 0) {

                                $('.img-thumbnail').attr('src',response.photo.getAt(0).location)





                            } else {
                                   alert(response.message)
                            }


                        });

            }




        </script>







    </div>






</div>




</body>
</html>