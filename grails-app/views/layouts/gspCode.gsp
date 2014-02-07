<%--
 Created by IntelliJ IDEA.
 User: yi
 Date: 20/11/13
 Time: 18:22
 To change this template use File | Settings | File Templates.
--%>

<html>
<head>

    <meta name="layout" content="gspModelCode">
    %{--<title>Token Select</title>--}%
    <title>Dashboard</title>

</head>

<body>

%{--Detect whether the token is seleceted.--}%
<br><br>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>

%{--<g:link controller="allservice" action="refresh" params="[sid:session.sid]" style="margin-left: 3%" >Refresh</g:link>--}%
%{--<div id="accordion">--}%


<div>

    <g:each in="${deviceType}" var="d">
        <p class="tableInDashboard">${d.value.name}</p>

        <div class="dashBoardBoard">
            <table class="table table-striped">
                <tr>
                    %{--<th>#</th>--}%
                    <th class="dashboardFont">SERIAL</th>
                    <th class="dashboardFont">STATUS</th>
                    <g:if test="${oobaEnabled && d.value.ooba}">
                    %{--mark--}%



                        <th></th>
                        <th class="dashboardDevice">DEVICE TYPE</th>
                        <th></th>

                    </g:if>
                    <g:else>
                        <th></th>
                    </g:else>

                </tr>
                <g:each in="${tokenList}" var="t">
                    <g:if test="${t.token.product.name == d.value.name}">

                        <tr class="active">
                            %{--<td><input type="radio" name="token" value="${t.serial}">   </td>--}%
                            <td class="dashboardFont">
                                ${t.token.serial}
                            </td>

                            <g:if test="${t.status == 'INACTIVE'}">
                                <td class="dashboardFont">
                                    INACTIVE
                                    <br><g:link controller="activate"
                                                action="activate"
                                                params="[id: t.id, sn: t.token.serial]">Activate</g:link>

                                </td>
                            </g:if>
                            <g:elseif test="${t.status == 'DISABLED'}">
                                <td class="dashboardFont">

                                    ${t.status}

                                    <a data-toggle="tooltip" data-placement="top" href="#" style="font-weight: bold"
                                       data-content="content" data-delay="0"
                                       title="This token has been disabled. Please contact your IT support to enable it.">&#63;</a>

                                </td>

                            </g:elseif>
                            <g:else>
                                <td class="dashboardFont">
                                    ${t.status}</td>
                            </g:else>


                            <g:if test="${t.token.product.functions.contains('OOBA') && t.token.product.provisioning == 'Download'}">
                                <g:if test="${oobaEnabled}">
                                    <g:if test="${t.token.oobDeviceType}">

                                        <g:if test="${t.token.oobDeviceType == "Android"}">
                                            <td class="dashboardIcon">

                                                <img src="${createLinkTo(dir: 'images', file: 'android.png')}"/>
                                            </td>

                                        </g:if>
                                        <g:elseif
                                                test="${t.token.oobDeviceType == "IOS" || t.token.oobDeviceType == "iOS"}">
                                            <td class="dashboardIcon">
                                                <img src="${createLinkTo(dir: 'images', file: 'mac.png')}"/>
                                            </td>
                                        </g:elseif>
                                        <g:else>
                                            <td class="dashboardIcon">
                                                <img src="${createLinkTo(dir: 'images', file: 'smartphone.png')}"/>
                                            </td>

                                        </g:else>

                                        <td class="dashboardDevice">
                                            ${t.token.oobDeviceModel}

                                        </td>


                                    %{--<td>--}%
                                    %{--<p style="margin: 0;padding: 0;">${t.token.oobDeviceType} <br > <p style="margin: 0;padding: 0;font-size: 11px; font-style: italic ">Sumsung I9100</p></p>--}%

                                    %{--</td>--}%
                                    </g:if>
                                    <g:elseif test="${t.status != 'DISABLED'}">
                                        <td></td> <td class="dashboardDevice">Unregistered</td>

                                    </g:elseif>
                                    <g:else>
                                        <td></td> <td class="dashboardDevice">N/A</td>
                                    </g:else>
                                </g:if>

                            </g:if>
                            <g:else>
                            %{--<td></td>--}%
                            %{--<td></td>--}%
                            %{--<td class="dashboardDevice">N/A</td>--}%
                            </g:else>

                            <td>
                                <g:if test="${t.token.product.provisioning == "Download" || t.token.product.functions.contains('OOBA')}">
                                    <g:if test="${t.status != "DISABLED"}">

                                        <g:if test="${device == 'PC'}">
                                            <g:render template="../layouts/downloadAndRegisterPC"
                                                      model="[
                                                              't': t
                                                      ]"></g:render>

                                        </g:if>
                                        <g:else>
                                            <g:render template="../layouts/downloadAndRegisterMobile"
                                                      model="[
                                                              't': t

                                                      ]"></g:render>
                                        </g:else>

                                    </g:if>
                                </g:if>
                                <g:else>

                                    <span class="glyphicon glyphicon-chevron-down invisible">

                                    </span>

                                </g:else>
                            </td>

                        </tr>

                    </g:if>

                </g:each>
            </table>

        </div>

    </g:each>

</div>


%{--<a href="#" onclick="changeIcon('#changeSpan')">--}%
%{--click--}%
%{--</a>--}%
%{--<p style="text-align: left;font-size: 12px;"--}%
%{--class="glyphicon glyphicon-chevron-up test " id="changeSpan" ></p>--}%

%{--<script type="text/javascript">--}%
%{--function changeIcon(id){--}%
%{--var spanId = id--}%
%{--$(spanId).removeClass("test").addClass("replace");--}%



%{--}--}%

%{--</script>--}%




%{--<div>--}%

%{--<input type="text" class="form-control" style="padding-left: 3px"--}%
%{--placeholder="Please enter your Authorization Code:" required="" autofocus="" id="ac" name="login">--}%

%{--<button class="btn btn-lg btn-primary btn-block " type="submit" style="margin-top: 10px" onclick="submitAC()">Submit</button>--}%
%{--</div>--}%

</body>
</html>
