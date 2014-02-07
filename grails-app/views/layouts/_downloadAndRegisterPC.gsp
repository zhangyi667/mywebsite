<g:if test="${t.token.product.manufacturerCode == 'GG'}">
    <a href="#" data-toggle="modal" data-target="#DOWNLOADANDREGISTER${t.token.serial}" id="button${t.token.serial}"
       onclick="showGGImg('${t.token.serial}')">
        <span class="glyphicon glyphicon-save">

        </span>

    </a>
</g:if>


<g:elseif test="${!oobaEnabled}">
    <a href="#" data-toggle="modal" data-target="#DOWNLOADANDREGISTER${t.token.serial}" id="button${t.token.serial}"
       onclick="showOtpImg('${t.token.serial}')">
        <span class="glyphicon glyphicon-save">

        </span>

    </a>
</g:elseif> <g:else>
    <a href="#" data-toggle="modal" data-target="#DOWNLOADANDREGISTER${t.token.serial}" id="button${t.token.serial}"
       onclick="showRgsImg('${t.id.encodeAsURL()}', '${t.token.serial}')">
        <span class="glyphicon glyphicon-save">

        </span>

    </a>

</g:else>



<g:if test="${t.id.encodeAsURL() == current || t.token.serial == sn}">

    <div class="modal fade" id="DOWNLOADANDREGISTER${t.token.serial}" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true" data-show="true">

    <g:javascript>
        var modalID = '#DOWNLOADANDREGISTER'+${t.token.serial}
        var id = ${t.token.serial}
    $(modalID).on('shown.bs.modal',function(){
       showGGImg(id);

    });

    </g:javascript>

</g:if>
<g:else>
    <div class="modal fade" id="DOWNLOADANDREGISTER${t.token.serial}" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel"
     aria-hidden="true">

</g:else>
%{--<div class="modal fade" id="DOWNLOADANDREGISTER${t.token.serial}" tabindex="-1" role="dialog"--}%
%{--aria-labelledby="myModalLabel"--}%
%{--aria-hidden="true">--}%

<div class="modal-dialog">
    <div class="modal-content">

        <div class="modal-header" style="padding: 5px">

            <h4 style="margin-bottom: 2px">Registration</h4>
        </div>

        <g:if test="${t.token.product.manufacturerCode == 'GG'}">
            <div class="modal-body">
                <p style="text-align: left">Please click "Download" to download  Google Auth on your mobile device:</p>
                <a href="../googleauth/download?sn=${t.token.serial}" class="btn btn-primary">Download</a>

                <p style="text-align: left">Once you have downloaded Google Auth, please scan the QR code to continue:
                    <br> <small>(If this QR code has expired, please click the QR code to refresh: )</small>
                </p>

                <g:if test="${t.id.encodeAsURL() == current || t.token.serial == sn}">
                    <img src="../googleauth/qrcode?sn=${t.token.serial}" id="img${t.token.serial}"
                         onclick="showGGImg('${t.token.serial}')"/>
                    <br><br>
                </g:if> <g:else>
                <img src="#" id="img${t.token.serial}"
                     onclick="showGGImg('${t.token.serial}')"/>
                <br><br>
            </g:else>
            </div>

        </g:if>


        <g:else>
            <g:if test="${oobaEnabled}">
                <div class="modal-body">
                    <div class="panel-group" id="accordion${t.token.serial}">
                        <div class="panel">
                            <p style="text-align: left">First, please download  MobileID on your mobile device:</p>
                            <a href="../mobileid/download?sn=${t.token.serial}" class="btn btn-primary"
                               style="text-align: left">Download</a>
                            %{--<a href="${downloadMobileID}">Download</a>--}%
                            <br><br>

                            <p style="text-align: left">
                                <a data-toggle="collapse" onclick="changeIcon('#span${t.token.serial}')"
                                   data-parent="#accordion${t.token.serial}" href="#collapseTwo${t.token.serial}">
                                    <span style="text-align: left;font-size: 12px;" id="span${t.token.serial}"
                                          class="glyphicon glyphicon-chevron-up "></span>
                                </a>

                            </p>


                            <div class=" collapse panel-collapse in " id="collapseTwo${t.token.serial}">
                                <p style="text-align: left">Once you have downloaded MobileID client, please scan the QR code to continue:
                                    <br><small>(If this QR code has expired, please click the QR code to refresh: )</small>
                                </p>

                                <g:if test="${t.id.encodeAsURL() == current || t.token.serial == sn}">
                                    <img src="../ooba/qrcode?id=${t.id.encodeAsURL()}"
                                         id="img1${t.token.serial}"
                                         onclick="showRgsImg('${t.id.encodeAsURL()}', '${t.token.serial}')"/>

                                </g:if>
                                <g:else>

                                    <img src="#" id="img1${t.token.serial}"
                                         onclick="showRgsImg('${t.id.encodeAsURL()}', '${t.token.serial}')"/>
                                </g:else>
                            </div>
                        </div>



                        <g:if test="${t.token.product.functions.contains("OOBA")}">
                            <g:if test="${t.token.oobDeviceType}">
                                <div class="panel ">
                                    <p style="font-size: 12px;text-align: left">Currently your token is registered with Device: ${t.token.oobDeviceModel}. By scanning the QR code
                                    , you will register your current device with this token(serial number:${t.token.serial}) and replace the old one. If you only want to download
                                    the token without registering it, please <a
                                            style="text-align: left;font-size: 12px;"
                                            data-toggle="collapse"
                                            onclick="showOtpImg('${t.token.serial}')"

                                            data-parent="#accordion${t.token.serial}"
                                            href="#${t.token.serial}collapseThree">
                                        click here
                                    </a> and scan the QR code:</p>


                                    <div id="${t.token.serial}collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <img src="#" id="img2${t.token.serial}"
                                                 onclick="showOtpImg('${t.token.serial}')"/>

                                        </div>
                                    </div>
                                </div>
                            </g:if>
                            <g:else>
                                <div class="panel ">
                                    <p style="font-size: 12px;text-align: left">By scanning the QR code, you will register your current device with this token(serial number:${t.token.serial}) and
                                    download the token. If you only want to download
                                    the token, please <a style="text-align: left;font-size: 12px;"
                                                         data-toggle="collapse"
                                                         onclick="showOtpImg('${t.token.serial}')"
                                                         data-parent="#accordion${t.token.serial}"
                                                         href="#${t.token.serial}collapseThree">
                                        click here
                                    </a>and scan the QR code:</p>


                                    <div id="${t.token.serial}collapseThree" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <img src="#" id="img2${t.token.serial}"
                                                 onclick="showOtpImg('${t.token.serial}')"/>

                                        </div>
                                    </div>

                                </div>

                            </g:else>

                        </g:if>

                    </div>

                </div> <!--modal body-->
            </g:if>
            <g:else>

                <div class="modal-body">

                    <p style="text-align: left">First, please download  MobileID on your mobile device:</p>

                    <a href="../mobileid/download?sn=${t.token.serial}" class="btn btn-primary"
                       style="text-align: left">Download</a>

                    <br>  <br>

                    <p style="text-align: left">Once you have downloaded the app, please scan the QRcode to continue<br>
                        <small>(If the QRcode has expired, please click the image to refresh)</small>:
                    </p>


                    <div class="panel-body">

                        <g:if test="${t.id.encodeAsURL() == current || t.token.serial == sn}">
                            <img src="../mobileid/qrcode?sn=${t.token.serial}"
                                 id="img2${t.token.serial}"
                                 onclick="showOtpImg('${t.token.serial}')"/>

                        </g:if>
                        <g:else>

                            <img src="#" id="img2${t.token.serial}"
                                 onclick="showOtpImg('${t.token.serial}')"/>
                        </g:else>

                    </div>

                </div>

            </g:else>

        </g:else>



        <div class="modal-footer">

            <button type="button" class="btn btn-default"
                    data-dismiss="modal">Close</button>

        </div>  <!--modal footer-->

    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


%{--<g:javascript>--}%
%{--var url = "../ooba/qrcode?id="+"${t.id.encodeAsURL()}"--}%
%{--var id = "#DOWNLOADANDREGISTER"+"${t.token.serial}"--}%
%{--var img1 = "#img1"+"${t.token.serial}"--}%

%{--</g:javascript>--}%


<script type="text/javascript">


    function showImg(assginID, imgID) {
        var targetIMG = "#img1" + imgID
        $(targetIMG).attr('src', '../images/spinner.gif')
        setTimeout(function () {
            $(targetIMG).attr('src', '../ooba/qrcode?id=' + assginID)


        }, 500)
    }

    function showRgsImg(assginID, imgID) {
        var targetIMG = "#img1" + imgID
        var theurlAdd = '../ooba/requestQRCode?id=' + assginID
        $.ajax({
            url: theurlAdd,
            dataType: "json"
        }).done(function (response) {

                    if (response.errorcode == 0) {

                        $(targetIMG).attr('src', '../images/spinner.gif')
                        setTimeout(function () {
                            $(targetIMG).attr('src', '../ooba/qrcodeUrl?url=' + response.urlAdd)


                        }, 500)

                    } else {
                        $(targetIMG).attr('src', '../images/spinner.gif')
                        var message = "<p style='font-size: 12px;text-align: left;color: red'>Error happened. Error code: " + response.errorcode + "." + response.theMessage + ". Please try again or contact your IT support.</p>"
                        $(targetIMG).replaceWith(message)

                    }

                });


    }


    //    function showOtpImg(imgID) {
    //        var targetIMG = "#img2" + imgID
    //        $(targetIMG).attr('src', '../images/spinner.gif')
    //        setTimeout(function () {
    //            $(targetIMG).attr('src', '../mobileid/qrcode?sn=' + imgID)
    //        }, 500)
    //
    //
    //    }


    function changeIcon(id) {
//        $(id).toggleClass(' glyphicon-chevron-up',' glyphicon-chevron-down')
//        var divID = '#collapseTwo'+id

//        if($(divID).hasClass('collapse') && $(id).hasClass('glyphicon-chevron-down'))  {
//            $(id).removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')
//
//        }else if($(divID).hasClass('in') && $(id).hasClass('glyphicon-chevron-up'))  {
//            $(id).removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
//
//        }


        if ($(id).hasClass('glyphicon-chevron-up')) {
            $(id).removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
        } else if ($(id).hasClass('glyphicon-chevron-down')) {
            $(id).removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')

        }
    }


    function showOtpImg(imgID) {
        var targetIMG = "#img2" + imgID
        var theurlAdd = '../mobileid/requestQRCode?sn=' + imgID
        var spanID = '#span' + imgID
        $.ajax({
            url: theurlAdd,
            dataType: "json"
        }).done(function (response) {

                    if (response.errorcode == 0) {

                        $(targetIMG).attr('src', '../images/spinner.gif')
                        setTimeout(function () {
                            $(targetIMG).attr('src', '../mobileid/qrcodeUrl?url=' + response.urlAdd)


                        }, 500)

                    } else {
                        $(targetIMG).attr('src', '../images/spinner.gif')
                        var message = "<p style='font-size: 12px;text-align: left;color: red'>Error happened. Error code: " + response.errorcode + "." + response.theMessage + ". Please try again or contact your IT support.</p>"
                        $(targetIMG).replaceWith(message)

                    }

                    if ($(spanID).hasClass('glyphicon-chevron-up')) {
                        $(spanID).removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down')
                    } else if ($(spanID).hasClass('glyphicon-chevron-down')) {
                        $(spanID).removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up')

                    }

                });


    }


    function submitAC(imgID) {
        var acValue = $('#ac').val();
        var theurlAdd = '../googleauth/submitAc?sn=' + imgID + '&ac=' + acValue;
        var targetIMG = "#img" + imgID;


        $.ajax({
            url: theurlAdd,
            dataType: "json"
        }).done(function (response) {

                    if (response.errorcode == 0) {
                        var newPic = '<img src="../images/spinner.gif" id="img' + imgID + '">';
                        $(targetIMG).empty().replaceWith(newPic);


                        setTimeout(function () {
                            $(targetIMG).attr('src', '../googleauth/qrcodeUrl?url=' + response.urlAdd)


                        }, 500)

                        $(targetIMG).attr("onclick", "showGGImg('" + imgID + "')");


                    } else {
//                        $(targetIMG).attr('src', '../images/spinner.gif')
                        var message = "<p style='font-size: 12px;text-align: left;color: red'>Error happened. Error code: " + response.errorcode + "." + response.theMessage + ". Please try again or contact your IT support.</p>"
                        message += '<div class="col-sm-8"><input type="text" class="form-control " style="padding-left: 3px" placeholder="Please enter your Authorization Code:" required="" autofocus="" id="ac" name="submitAC"></div>'
                        message += '<div class="col-md-4"><button class="btn btn-primary" type="submit" id="submitAcButton" >Submit</button></div>'
                        $(targetIMG).empty().append(message);
                        $("#submitAcButton").attr("onclick", "submitAC('" + imgID + "')");

                    }


                });

    }
    function showGGImg(imgID) {
        var targetIMG = "#img" + imgID
        var theurlAdd = '../googleauth/requestQRCode?sn=' + imgID


//        $(targetIMG).attr('src', '../images/spinner.gif')
//        setTimeout(function () {
//            $(targetIMG).attr('src', '../googleauth/qrcode?sn=' + imgID)
//        }, 500)

        $.ajax({
            url: theurlAdd,
            dataType: "json"
        }).done(function (response) {

                    if (response.errorcode == 0) {

                        if (response.theMessage == null) {
                            $(targetIMG).attr('src', '../images/spinner.gif')
                            setTimeout(function () {
                                $(targetIMG).attr('src', '../googleauth/qrcodeUrl?url=' + response.urlAdd)


                            }, 500)
                        } else if (response.theMessage == "AC") {
                            $(targetIMG).attr('src', '../images/spinner.gif')
                            var message = "<div id=img" + imgID + "><p style='font-size: 12px;text-align: left;color: red'>You have to enter the authorization code to continue:</p>";
                            message += '<div class="col-sm-8" style="padding-left: 0"><input type="text" class="form-control "  placeholder="Please enter your Authorization Code:" required="" autofocus="" id="ac" name="submitAC"></div>';
//                            message += '<div class="col-md-4"><button class="btn btn-primary" type="submit" id="submitAcButton"  >Submit</button></div></div>';
                            message += "<div class='col-md-4'><a class='btn btn-primary' id=submitAcButton>Submit</a></div></div>";


                            $(targetIMG).replaceWith(message);
                            $("#submitAcButton").attr("onclick", "submitAC('" + imgID + "')");


//                            var acValue = document.getElementById("ac").value;


                        }

                    } else {
                        $(targetIMG).attr('src', '../images/spinner.gif')
                        var message = "<p style='font-size: 12px;text-align: left;color: red'>Error happened. Error code: " + response.errorcode + "." + response.theMessage + ". Please try again or contact your IT support.</p>"
                        setTimeout(function () {
                            $(targetIMG).replaceWith(message);


                        }, 500)

                    }


                });


    }


    //    $(document).ready(function(){   $('.collapsezhangyi').on('shown.bs.collapse',function(){
    //        $('.spanzhangyi').removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
    //    });
    //        $('.collapsezhangyi').on('hidden.bs.collapse',function(){
    //            $('.spanzhangyi').removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
    //        });
    //
    //    })


    jQuery('[data-show="true"]').modal({

        show: true
    })

    %{--<g:javascript>--}%
    %{--var spanID = "span"+${t.token.serial};--}%
    %{--var collapseID = ${t.token.serial}+"collapseTwo";--}%

    %{--$(document).ready(function(){--}%
    %{--$('#10000015collapseTwo').on('shown.bs.collapse', function () {--}%
    %{--$(spanID).removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");--}%
    %{--});--}%

    %{--$('#10000015collapseTwo').on('hidden.bs.collapse', function () {--}%
    %{--$(spanID).removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");--}%
    %{--});--}%
    %{--});--}%

    %{--</g:javascript>--}%

</script>

