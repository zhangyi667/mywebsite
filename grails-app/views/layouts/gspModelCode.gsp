<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=0.8">
    <title><g:layoutTitle default="DualShield"/></title>
    <%@ page import = "com.deepnet.prov.DpsConf" %>

    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-select.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.css')}" type="text/css">--}%

    %{--<link rel="shortcut icon" href="${DpsConf.getShortCutIcon()}" type="image/x-icon"/>--}%
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'dualshield.ico')}" type="image/x-icon"/>


    %{--<script src="../dps/js/jquery-1.10.2.min.js"></script>--}%
    <script src="${resource(dir:'js/',file:'jquery-1.10.2.min.js')}"></script>
    <script src="${resource(dir:'js/',file:'bootstrap.js')}"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

    <![endif]-->
    <style type="text/css"></style>
    <g:layoutHead/>

</head>

<body class="newBody" >
%{--<header class="navbar navbar-fixed-top headerBackground " role="banner">--}%
    %{--<div class="container headerPosition">--}%
        %{--<div class="navbar-header">--}%
            %{--<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-navbar-collapse">--}%
                %{--<span class="sr-only">Toggle navigation</span>--}%
                %{--<span class="icon-bar"></span>--}%
                %{--<span class="icon-bar"></span>--}%
                %{--<span class="icon-bar"></span>--}%
            %{--</button>--}%
            %{--<a href="http://www.deepnetsecurity.com/dualshield" style="padding-right: 20px">--}%
                %{--<img src="${resource(dir: 'images', file: 'logo.gif')}" alt="DualShield"/>--}%
            %{--</a>--}%
        %{--</div>--}%
        %{--<nav class="collapse navbar-collapse "id="bs-navbar-collapse " role="navigation">--}%

            %{--<g:render template="/layouts/location"></g:render>--}%

            %{--<g:render template="/layouts/account"></g:render>--}%
        %{--</nav>--}%
    %{--</div>--}%
%{--</header>--}%


<nav class="navbar  navbar-fixed-top navbar-default bs-docs-nav headerBackground headerPosition" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    <a href="${DpsConf.getLogo().link}" style="padding-right: 20px">
        %{--<img src="${DpsConf.getLogo().location}" alt="DualShield"/>--}%
        <img src="${resource(dir: 'images', file: 'logo.gif')}" alt="DualShield"/>
    </a>
    %{--<g:logo/>--}%
</div>


    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

    <g:render template="/layouts/location"></g:render>

    <g:render template="/layouts/account"></g:render>



    </div><!-- /.navbar-collapse -->
</nav>

<div class="col-lg-offset-3 col-lg-6 topPosition" >
    %{--<div>--}%
        %{--<a href="http://www.deepnetsecurity.com/dualshield">--}%
            %{--<img src="${resource(dir: 'images', file: 'logo.gif')}" alt="DualShield"/>--}%
        %{--</a>--}%
    %{--</div>--}%






    <g:layoutBody/>







    <p class="bs-header" style="text-align: center">
    <td><a href="${DpsConf.getLink("support")}"  target="_blank">Support </a>|</td>
    <td><a href="${DpsConf.getLink("products")}">Products</a></td>
    %{--<td><a href="" target="_blank"> Contact Us</a></td>--}%
</p>


    %{--<div class="row">--}%
    %{--cantact us and support products downloads--}%

    %{--%1{--<div class="col-xs-4">--}%
    %{--<p style="float: left;margin-top: 20px;padding-left: 20px;">DualShield Unified Authentication Platform</p>--}%
    %{--</div>--}%



    %{--<p class="CopyRight" style="text-align: center">&copy; Deepnet Security Limited.</p>--}%
    <p class="CopyRight" style="text-align: center">${DpsConf.getCompany()}</p>




</div>

</body>
</html>

