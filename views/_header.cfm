<cfoutput>
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			<a class="brand" href="/"><img src="/images/logo_ribbon.png" /></a>
			<div class="nav-collapse">
				<ul class="nav">
					<li<cfif params.controller EQ "main"> class="active"</cfif>><a href="/">Home</a></li>
					<li<cfif params.controller EQ "activities"> class="active"</cfif>><a href="/activities/">Activities</a></li>
					<li<cfif params.controller EQ "people"> class="active"</cfif>><a href="/people/">People</a></li>
					<cfif isAdmin()>
					<li<cfif params.controller EQ "admin"> class="active"</cfif>><a href="/admin/">Admin</a></li>
					</cfif>
				</ul>
				<cfif NOT isLoggedIn()>
				<ul class="nav pull-right">
					<li><a href="/login">Log In</a></li>
					<li><a href="/signup">Sign Up</a></li>
				</ul>
				<cfelse>
				<ul class="nav pull-right">
					<li class="divider-vertical"></li>
					<li class="dropdown">
						<a href="##" class="dropdown-toggle" data-toggle="dropdown"><i class="fugue-#session.currentuser.id#" style="background-image:url('http://www.gravatar.com/avatar/#lcase(HASH(session.currentuser.email,'MD5'))#?d=identicon&s=16');background-position:0 0; margin-right:2px;"></i> #session.currentuser.displayname# <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/people/edit/#session.currentuser.id#">Edit Profile</a></li>
							<li class="divider"></li>
							<li><a href="/logout">Logout</a></li>
						</ul>
					</li>
				</ul>
				</cfif>
			</div><!--/.nav-collapse -->
			<form class="navbar-search pull-left">
				<input type="text" class="search-query" placeholder="Search">
			</form>
		</div>
	</div>
</div>

<div id="page" class="container">
</cfoutput>