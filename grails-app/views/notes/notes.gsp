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

    <div class="frame col-lg-8  col-lg-offset-2">
        %{--loop the articles--}%
           <div >
               <h3 class="left">First Blog</h3>
               <p class="right"><small>Time</small></p>
               <div  >
                   <p class="left">This is the first blog.</p>
               </div>
           </div>
            <hr>

    </div>

<script type="text/javascript">
    $('#notes').addClass('active')

</script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js">


</script>

</body>
</html>