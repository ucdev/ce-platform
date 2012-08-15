<%@page import="de.deltatree.social.web.filter.api.SASFHelper"%>
<%@page import="de.deltatree.social.web.filter.api.SASFStaticHelper"%>

<%
	SASFHelper helper = SASFStaticHelper.getHelper(request);
%>

<html>
<head>
<title>Social Auth Error Page</title>
</head>
<body>

	<table height="97%" width="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td align="center" valign="middle">
				<table cellpadding="0" cellspacing="0" border="1">
					<tr>

						<td align="center" valign="left"><pre>
<%=helper.getError()%>
	</pre>
							<hr /> <pre>
<%=helper.getErrorCauseAsString()%>
	</pre></td>
					</tr>
				</table></td>
		</tr>
	</table>
	<br />
	<br /> Go
	<a href="<%=request.getContextPath()%>/index.jsp">back</a>
</body>
</html>

