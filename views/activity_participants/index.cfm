<cfparam name="params.Page" type="numeric" default="1" />

<cfoutput>
<!--<h4>Participants</h4>-->
<div class="btn-toolbar clearfix">
	<div class="btn-group pull-left">
		<a href="##" class="btn"><i class="icon-plus-sign"></i> Add</a>
		<a href="##" class="btn"><i class="icon-hdd"></i> Import</a>
	</div>
	<div class="btn-group pull-left">
		<a class="btn dropdown-toggle" data-toggle="dropdown" href="##">
		Actions
		<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="##" id="remove-attendees">Remove</a></li>
			<li><a href="##">Change Statuses</a></li>
			<li class="divider"></li>
			<li><a href="##" id="print-cme" class="print">CME Certificates</a></li>
			<li><a href="##" id="print-cne" class="print">Nurse Certificates</a></li>
		</ul>
	</div>
	
	<div class="btn-group pull-right">
		<button class="btn" data-toggle="dropdown">Filter By:</button>
		<button class="btn attendee-status-title" data-toggle="dropdown">All</button>
		<button class="btn dropdown-toggle" data-toggle="dropdown">
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu attendees-filter">
			<li class="attendee-status" id="status0"><a href="##"> All <span></span></a></li>
			<li class="divider"></li>
			<li class="attendee-status" id="status1"><a href="##">Complete <span></span></a></li>
			<li class="attendee-status" id="status4"><a href="##">Failed <span></span></a></li>
			<li class="attendee-status" id="status2"><a href="##">In Progress <span></span></a></li>
			<li class="attendee-status" id="status3"><a href="##">Registered <span></span></a></li>
		</ul>
	</div>
	
	<div class="btn-group pull-right pager-simple">
		<a href="/activities/adm_participants?ActivityID=13660&status=0&page=#params.page-1#" class="btn previous prev-page<cfif params.page EQ 1> disabled</cfif>"><i class="icon-chevron-left"></i></a>
		<a class="btn dropdown-toggle" data-toggle="dropdown"><span id="pageSelector">#params.page#</span> <span class="caret"></span></a>
		<ul class="dropdown-menu pages">
		</ul>
		<a href="/activities/adm_participants?ActivityID=13660&status=0&page=#params.page+1#" class="btn next next-page"><i class="icon-chevron-right"></i></a>
	</div>
</div>
</cfoutput>

<script>
</script>
<div>
	<div id="RegistrantsContainer"></div>
	<div id="RegistrantsLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>
