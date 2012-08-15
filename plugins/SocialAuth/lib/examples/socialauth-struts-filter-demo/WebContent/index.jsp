<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" import="de.deltatree.social.web.filter.api.*,de.deltatree.social.web.filter.impl.*"%>

<html>
	<head>
		<title>SocialAuth Demo</title>
		<script>
			function validate(obj){
				var val = obj.id.value;
				if(trimString(val).length <= 0){
					alert("Please enter OpenID URL");
					return false;
				}else{
					return true;
				}
			}
			function trimString(tempStr)
			{
			   return tempStr.replace(/^\s*|\s*$/g,"");
			}
		</script>
	</head>
	<body>
		<c:set var="facebook" value="false" />
		<c:set var="twitter" value="false" />
		<c:set var="google" value="false" />
		<c:set var="yahoo" value="false" />
		<c:set var="hotmail" value="false" />
		<c:set var="linkedin" value="false" />
		<c:set var="foursquare" value="false" />
		<c:set var="myspace" value="false" />
		
		<%
			SASFHelper h=SASFStaticHelper.getHelper(request);
			if(h!=null)
				pageContext.setAttribute("socialAuthMgr",h.getAuthManager() );
		%>
		
		<c:forEach var="item" items="${socialAuthMgr.connectedProvidersIds}">
		 	<c:if test="${item eq 'facebook'}">
		    	<c:set var="facebook" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'google'}">
		    	<c:set var="google" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'twitter'}">
		    	<c:set var="twitter" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'yahoo'}">
		    	<c:set var="yahoo" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'hotmail'}">
		    	<c:set var="hotmail" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'linkedin'}">
		    	<c:set var="linkedin" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'myspace'}">
		    	<c:set var="myspace" value="true" />
		  	</c:if>
		  	<c:if test="${item eq 'foursquare'}">
		    	<c:set var="foursquare" value="true" />
		  	</c:if>
		</c:forEach>
		
		<table cellpadding="10" cellspacing="10" align="center">
			<tr><td colspan="8"><h3 align="center">Welcome to Social Auth Demo</h3></td></tr>
			<tr><td colspan="8"><p align="center">Please click on any icon.</p></td></tr>
			<tr>
				<td>
					<a href="socialAuth.do?id=facebook"><img src="images/facebook_icon.png" alt="Facebook" title="Facebook" border="0"></img></a>
					<br/>
					<c:if test="${facebook eq true}">
						<a href="socialAuth.do?id=facebook&mode=signout">Signout</a>
					</c:if>
					<c:if test="${facebook eq false}">
						<a href="socialAuth.do?id=facebook">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=twitter"><img src="images/twitter_icon.png" alt="Twitter" title="Twitter" border="0"></img></a>
					<br/>
					<c:if test="${twitter eq true}">
						<a href="socialAuth.do?id=twitter&mode=signout">Signout</a>
					</c:if>
					<c:if test="${twitter eq false}">
						<a href="socialAuth.do?id=twitter">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=google"><img src="images/gmail-icon.jpg" alt="Gmail" title="Gmail" border="0"></img></a>
					<br/>
					<c:if test="${google eq true}">
						<a href="socialAuth.do?id=google&mode=signout">Signout</a>
					</c:if>
					<c:if test="${google eq false}">
						<a href="socialAuth.do?id=google">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=yahoo"><img src="images/yahoomail_icon.jpg" alt="YahooMail" title="YahooMail" border="0"></img></a>
					<br/>
					<c:if test="${yahoo eq true}">
						<a href="socialAuth.do?id=yahoo&mode=signout">Signout</a>
					</c:if>
					<c:if test="${yahoo eq false}">
						<a href="socialAuth.do?id=yahoo">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=hotmail"><img src="images/hotmail.jpeg" alt="HotMail" title="HotMail" border="0"></img></a>
					<br/>
					<c:if test="${hotmail eq true}">
						<a href="socialAuth.do?id=hotmail&mode=signout">Signout</a>
					</c:if>
					<c:if test="${hotmail eq false}">
						<a href="socialAuth.do?id=hotmail">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=linkedin"><img src="images/linkedin.gif" alt="Linked In" title="Linked In" border="0"></img></a>
					<br/>
					<c:if test="${linkedin eq true}">
						<a href="socialAuth.do?id=linkedin&mode=signout">Signout</a>
					</c:if>
					<c:if test="${linkedin eq false}">
						<a href="socialAuth.do?id=linkedin">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=foursquare"><img src="images/foursquare.jpeg" alt="FourSquare" title="FourSquare" border="0"></img></a>
					<br/>
					<c:if test="${foursquare eq true}">
						<a href="socialAuth.do?id=foursquare&mode=signout">Signout</a>
					</c:if>
					<c:if test="${foursquare eq false}">
						<a href="socialAuth.do?id=foursquare">Signin</a><br/>
					</c:if>
				</td>
				<td>
					<a href="socialAuth.do?id=myspace"><img src="images/myspace.jpeg" alt="MySpace" title="MySpace" border="0"></img></a>
					<br/>
					<c:if test="${myspace eq true}">
						<a href="socialAuth.do?id=myspace&mode=signout">Signout</a>
					</c:if>
					<c:if test="${myspace eq false}">
						<a href="socialAuth.do?id=myspace">Signin</a><br/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center">
					<form action="socialAuth.do" onsubmit="return validate(this);">
						or enter OpenID url: <input type="text" value="" name="id"/>
						<input type="submit" value="Submit"/> 
					</form>
				</td>
			</tr>
			
		</table>
		<script type="text/javascript">
			var _gaq = _gaq || [];
		  	_gaq.push(['_setAccount', 'UA-18575385-2']);
		  	_gaq.push(['_trackPageview']);
		
		  	(function() {
		    	var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    	ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    	var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  	})();
		</script>
		
	</body>
</html>