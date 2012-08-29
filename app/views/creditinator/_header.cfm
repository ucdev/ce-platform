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
				<span class="header-title">Credit Delivery System</span>
				<div class="nav-collapse">
					<!---<ul class="nav">
						<li<cfif params.controller EQ "main"> class="active"</cfif>><a href="/">Home</a></li>
						<li<cfif params.controller EQ "activities"> class="active"</cfif>><a href="/activities/">Activities</a></li>
						<li<cfif params.controller EQ "people"> class="active"</cfif>><a href="/people/">People</a></li>
						<cfif isAdmin()>
						<li<cfif params.controller EQ "admin"> class="active"</cfif>><a href="/admin/">Admin</a></li>
						</cfif>
					</ul>
					--->
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="container contentArea">
</cfoutput>