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
    <p style="text-align: right">
        zhangyi667@gmail.com
    </p>
    <p style="text-align: right">
        I don't do twitter.
    </p>
    <p style="text-align: left">

        Thank you for visiting my website. I started writing this website on 6th Feb,2014 and I will keep updating until all work fine.
    </p>

    <p style="font-weight: bold;text-align: left">Summary of this website:</p>
    <p style="text-align: left">
        This website is written in Grails 2.2.4, nothing is hardcoded in HTML. I only use class-based views for better code reuse. The site still needs to be improved and refined and I'm getting all these done soon.
    </p>

    <p style="font-weight: bold;text-align: left">Something about me:</p>
    <p style="text-align: left">
        I am a Programmer with a Master degree of Computer Science, which I got in Nov,2013. I have a lot of hobbies. I love music, photograph, basketball, travelling, cooking and drinking :-). In this website you would see some pictures of my life. Currently I am living in the UK. My major skills are Grails, Groovy, Android, and, of course, Java. I am interested in Search engine and machine learning, and wish to do something cool someday:)

    </p>

    <p style="font-weight: bold;text-align: left">Project log:</p>
    <p style="text-align: left">Feb 6th, 2014:<br>Start to build the website.</p>


</div>




</body>
</html>
