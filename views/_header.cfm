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
					</ul>
					<ul class="nav pull-right">
						<li><a href="/login">Log In</a></li>
						<li><a href="/signup">Sign Up</a></li>
					</ul>
				</div><!--/.nav-collapse -->
				<form class="navbar-search pull-left">
					<input type="text" class="search-query" placeholder="Search">
				</form>
			</div>
		</div>
	</div>

	<div class="container">