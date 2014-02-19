<%--
 Created by IntelliJ IDEA.
 User: yi
 Date: 20/11/13
 Time: 18:22
 To change this template use File | Settings | File Templates.
--%>

<html>
<head>

    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Home</title>

</head>

<body>

%{--Detect whether the token is seleceted.--}%
<br><br>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>



<div  class="frame col-lg-8 col-lg-offset-2 opacity">

    <p class="right">
       ${name}
    </p>
    <p class="right">
        ${email}
    </p>
    <p style="text-align: right">
        ${twitter}
    </p>
    <p style="text-align: left">

        ${welcome}
    </p>

    <p style="font-weight: bold;text-align: left">${webinfoTitle}</p>
    <p style="text-align: left">
        ${webinfoContent}
    </p>

    <p style="font-weight: bold;text-align: left">${selfIntroTitle}</p>
    <p style="text-align: left">
        ${selfIntroContent}

    </p>




</div>




</body>
</html>
