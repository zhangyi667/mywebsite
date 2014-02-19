<%--
  Created by IntelliJ IDEA.
  User: yi
  Date: 07/02/14
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main">
    %{--<title>Token Select</title>--}%
    <title>Notes</title>
</head>
<body>
    %{--loop the articles--}%
    <g:if test="${flash.message}">
        <div>
            <p>${flash.message}</p>
        </div>

    </g:if>

    <g:each in="${blogs}" var="b">
        <div class="frame col-lg-8  col-lg-offset-2">
            <div >
                <h3 class="left">${b.value.title}</h3>  %{--Title--}%
                <p class="right"><small>${b.value.createTime}</small></p>
                <div >
                    %{--<p class="left">This is the first blog.</p>--}%
                    <p class="left">
                        ${b.value.log}
                    </p>

                    <p class="left">...</p>

                </div>

                <g:if test="${short == true}">

                    <g:link controller="notes" action="index" params="['id':b.key]" >

                        <div>
                            <p class="right">More</p>

                        </div>
                    </g:link>
                </g:if>

            </div>
            <hr>

        </div>

    </g:each>





%{--<script type="text/javascript">--}%
    %{--$('#notes').addClass('active')--}%
    %{--function textAreaScrollBottom(id) {--}%
        %{--$(id).scrollTop = $(id).scrollHeight;--}%
    %{--}--}%

%{--</script>--}%

%{--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js">--}%


%{--</script>--}%

</body>
</html>