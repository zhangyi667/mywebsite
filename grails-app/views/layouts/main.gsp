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

    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-select.css')}" type="text/css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    %{--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'dualshield.ico')}" type="image/x-icon"/>--}%


    %{--<script src="../dps/js/jquery-1.10.2.min.js"></script>--}%
    <script src="${resource(dir: 'js/', file: 'jquery-1.10.2.min.js')}"></script>
    <script src="${resource(dir: 'js/', file: 'bootstrap.js')}"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>

    <![endif]-->
    <style type="text/css"></style>
    <g:layoutHead/>

</head>

<body class="newBody">
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


%{--<nav class="navbar  navbar-fixed-top navbar-default bs-docs-nav headerBackground headerPosition" role="navigation">--}%
%{--<!-- Brand and toggle get grouped for better mobile display -->--}%
%{--<div class="navbar-header">--}%
%{--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">--}%
%{--<span class="sr-only">Toggle navigation</span>--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--</button>--}%

%{--<a href="${DpsConf.getLogo().link}" style="padding-right: 20px">--}%
%{--<img src="${DpsConf.getLogo().location}" alt="DualShield"/>--}%
%{--<img src="${resource(dir: 'images', file: 'logo.gif')}" alt="DualShield"/>--}%
%{--</a>--}%
%{--<g:logo/>--}%
%{--</div>--}%


%{--<!-- Collect the nav links, forms, and other content for toggling -->--}%
%{--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--}%
%{--<li> <g:link controller="albums"  action = "index">Albums </g:link> </li>--}%
%{--<li> <g:link controller="notes"  action = "index">Notes </g:link> </li>--}%
%{--<li> <g:link controller="experience"  action = "index">Experience </g:link> </li>--}%




%{--</div><!-- /.navbar-collapse -->--}%
%{--</nav>--}%

<nav class="navbar   navbar-default bs-docs-nav headerBackground headerPosition " role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                %{--the icon image which expand/collapse the other buttons--}%
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <g:link controller="front" class="navbar-brand" action="index">Home</g:link>

        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

                <li id="albums"><g:link controller="albums" action="index">Albums</g:link></li>
                <li id="notes"><g:link controller="notes" action="index">Notes</g:link></li>



                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">About me <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><g:link controller="aboutme" action="index">selfIntro</g:link></li>
                        <li><g:link controller="aboutme" action="experience">Experience(not done)</g:link></li>

                        %{--it's a divider line--}%
                        <li class="divider"></li>

                    </ul>
                </li>
            </ul>
            %{--<form class="navbar-form navbar-left" role="search">--}%
            %{--<div class="form-group">--}%
            %{--<input type="text" class="form-control" placeholder="Search">--}%
            %{--</div>--}%
            %{--<button type="submit" class="btn btn-default">Submit</button>--}%
            %{--</form>--}%
            %{--<ul class="nav navbar-nav navbar-right">--}%
            %{--<li><a href="#">Link</a></li>--}%
            %{--<li class="dropdown">--}%
            %{--<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>--}%
            %{--<ul class="dropdown-menu">--}%
            %{--<li><a href="#">Action</a></li>--}%
            %{--<li><a href="#">Another action</a></li>--}%
            %{--<li><a href="#">Something else here</a></li>--}%
            %{--<li class="divider"></li>--}%
            %{--<li><a href="#">Separated link</a></li>--}%
            %{--</ul>--}%
            %{--</li>--}%
            %{--</ul>--}%
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div >
    %{--<div>--}%
    %{--<a href="http://www.deepnetsecurity.com/dualshield">--}%
    %{--</a>--}%
    %{--</div>--}%

        <div id="header-profile" class="col-lg-4 col-sm-12 col-lg-offset-6">

            %{--<div id="name-frame" class="col-lg-8">--}%
            %{--<p>--}%
            %{--Welcome blah blah blah...--}%
            %{--</p>--}%
            %{--</div  >--}%
            %{--<div class="div-for-headerpic"  >--}%
            %{--<img src="${resource(dir: 'images', file: 'tuzi.gif')}" class="img-thumbnail" />--}%

            %{--</div   >--}%

            <div class="media">
                <img src="${resource(dir: 'images', file: 'photos/me.jpg')}"
                     class="img-thumbnail name-frame pull-right story-small" style="margin-left: 1px; padding:2px;" width="128" height="128" />

                <div  class="media-body name-frame ">
                    <h4 class="media-heading">Yi Zhang</h4>

                    <p>This is a very bored boy.</p>

                </div>
            </div>

        </div>




    <g:layoutBody/>






    <div id="bottom-bar" class="navbar navbar-inverse navbar-custom-bottom col-lg-12 col-md-12 col-sm-12 opacity">
        <p id="bottom-text">Designed &amp; Coded by Yi Zhang,<br> zhangyi667@gmail.com</p>
    </div>





    %{--<div style="text-align: center;margin-top: 20px" class="col-lg-12 col-md-12 col-sm-12">--}%
        %{--<p>--}%
            %{--Designed & Coded by Yi Zhang. <br> zhangyi667@gmail.com--}%
        %{--</p>--}%
    %{--</div>--}%

</div>

</body>
</html>

<script type="text/javascript">

//    $('img').each(function () {
//        var maxWidth = 156;
//        var ratio = 0;
//        var img = $(this);
//
//        if (img.width() > maxWidth) {
//            ratio = img.height() / img.width();
//            img.attr('width', maxWidth);
//            img.attr('height', (maxWidth * ratio));
//        }
//    });

</script>

