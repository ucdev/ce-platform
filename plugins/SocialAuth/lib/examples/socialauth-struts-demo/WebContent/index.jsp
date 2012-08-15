<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>BrickRed SocialAuth Demo </title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1{text-align: justify;}
    </style>
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
	<c:set var="salesforce" value="false" />
	<c:set var="yammer" value="false" />
	<c:set var="mendeley" value="false" />
	<c:forEach var="item" items="${authForm.socialAuthManager.connectedProvidersIds}">
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
	  	<c:if test="${item eq 'salesforce'}">
	    	<c:set var="salesforce" value="true" />
	  	</c:if>
	  	<c:if test="${item eq 'yammer'}">
	    	<c:set var="yammer" value="true" />
	  	</c:if>
	  	<c:if test="${item eq 'mendeley'}">
	    	<c:set var="mendeley" value="true" />
	  	</c:if>
	</c:forEach>
    <div id="logo">
        <div id="slogan">
            &nbsp;</div>
    </div>
    <div id="main">
        <div id="sidebar">
            <h1><a href="http://www.brickred.com/"><img alt="" src="images/logo.png" style="border: 0px" /></a></h1>
        </div>
        
        <div id="text" >
	       	<table cellpadding="10" cellspacing="10" align="center">
				<tr><td colspan="8"><h3 align="center">Welcome to Social Auth Demo</h3></td></tr>
				<tr><td colspan="8"><p align="center">Please click on any icon.</p></td></tr>
				<tr>
					<td>
						<a href="socialAuth.do?id=facebook"><img src="images/facebook_icon.png" alt="Facebook" title="Facebook" border="0"></img></a>
						<br/><br/>
						<c:if test="${facebook eq true}">
							<a href="socialAuth.do?id=facebook&mode=signout">Signout</a>
						</c:if>
						<c:if test="${facebook eq false}">
							<a href="socialAuth.do?id=facebook">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=twitter"><img src="images/twitter_icon.png" alt="Twitter" title="Twitter" border="0"></img></a>
						<br/><br/>
						<c:if test="${twitter eq true}">
							<a href="socialAuth.do?id=twitter&mode=signout">Signout</a>
						</c:if>
						<c:if test="${twitter eq false}">
							<a href="socialAuth.do?id=twitter">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=google"><img src="images/gmail-icon.jpg" alt="Gmail" title="Gmail" border="0"></img></a>
						<br/><br/>
						<c:if test="${google eq true}">
							<a href="socialAuth.do?id=google&mode=signout">Signout</a>
						</c:if>
						<c:if test="${google eq false}">
							<a href="socialAuth.do?id=google">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=yahoo"><img src="images/yahoomail_icon.jpg" alt="YahooMail" title="YahooMail" border="0"></img></a>
						<br/><br/>
						<c:if test="${yahoo eq true}">
							<a href="socialAuth.do?id=yahoo&mode=signout">Signout</a>
						</c:if>
						<c:if test="${yahoo eq false}">
							<a href="socialAuth.do?id=yahoo">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=hotmail"><img src="images/hotmail.jpeg" alt="HotMail" title="HotMail" border="0"></img></a>
						<br/><br/>
						<c:if test="${hotmail eq true}">
							<a href="socialAuth.do?id=hotmail&mode=signout">Signout</a>
						</c:if>
						<c:if test="${hotmail eq false}">
							<a href="socialAuth.do?id=hotmail">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=linkedin"><img src="images/linkedin.gif" alt="Linked In" title="Linked In" border="0"></img></a>
						<br/><br/>
						<c:if test="${linkedin eq true}">
							<a href="socialAuth.do?id=linkedin&mode=signout">Signout</a>
						</c:if>
						<c:if test="${linkedin eq false}">
							<a href="socialAuth.do?id=linkedin">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=foursquare"><img src="images/foursquare.jpeg" alt="FourSquare" title="FourSquare" border="0"></img></a>
						<br/><br/>
						<c:if test="${foursquare eq true}">
							<a href="socialAuth.do?id=foursquare&mode=signout">Signout</a>
						</c:if>
						<c:if test="${foursquare eq false}">
							<a href="socialAuth.do?id=foursquare">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=myspace"><img src="images/myspace.jpeg" alt="MySpace" title="MySpace" border="0"></img></a>
						<br/><br/>
						<c:if test="${myspace eq true}">
							<a href="socialAuth.do?id=myspace&mode=signout">Signout</a>
						</c:if>
						<c:if test="${myspace eq false}">
							<a href="socialAuth.do?id=myspace">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=mendeley"><img src="images/mendeley.jpg" alt="Mendeley" title="Mendeley" border="0"></img></a>
						<br/><br/>
						<c:if test="${mendeley eq true}">
							<a href="socialAuth.do?id=mendeley&mode=signout">Signout</a>
						</c:if>
						<c:if test="${mendeley eq false}">
							<a href="socialAuth.do?id=mendeley">Signin</a><br/>
						</c:if>
					</td>
					<td>
						<a href="socialAuth.do?id=yammer"><img src="images/yammer.jpg" alt="Yammer" title="Yammer" border="0"></img></a>
						<br/><br/>
						<c:if test="${yammer eq true}">
							<a href="socialAuth.do?id=yammer&mode=signout">Signout</a>
						</c:if>
						<c:if test="${yammer eq false}">
							<a href="socialAuth.do?id=yammer">Signin</a><br/>
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
           	<br />
	        <br />
	        <br />
	        <br />
	        <br />
	        <br />
	        <br />
	        <br />
	        <br />
            
             <p class="additional">
                BrickRed is India's leading provider of commercial grade offshore software development
                services to technology and IT enabled SME's worldwide. Lead by technocrat's from
                IIT's, our mission has been to provide professional and process oriented outsourcing
                services to SME sector that only fortune companies could muster till date by paying
                high prices to big service providers. BrickRed Technologies, founded in 2002, is
                a privately held organization head quartered at a state-of-art offshore development
                center in Noida, Delhi. With offices in the US, UK, Dubai, and recently, The Netherlands,
                we provide services for end to end development of commercial grade software products
                and applications to Start-up, Emerging and Established technology companies & IT
                enabled organizations.
            </p>
        </div>
    </div>
    
    <div id="footer">
        <div id="left_footer">
            <b>© 2010 BrickRed All Rights Reserved&nbsp;.</b></div>
        <div id="right_footer">
            <b>BrickRed Technologies Pvt. Ltd</b></div>
    </div>
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
