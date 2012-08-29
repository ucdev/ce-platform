
<cfoutput>
<div class="btn-toolbar clearfix">
	<div class="btn-group pull-left">
		<a href="##" class="btn"><i class="icon-plus-sign"></i></a>
		<a href="##" class="btn"><i class="icon-hdd"></i></a>
	</div>
	<div class="btn-group pull-left js-partic-actions">
		<a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="##">SELECTED: <span id="label-status-selected" class="js-attendee-status-selected-count">0</span></a>
		<a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="##">
			Actions
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="##" class="js-remove-attendees">Remove</a></li>
			<li class="divider"></li>
			<li class="nav-header">CHANGE STATUSES</li>
			<li><a href="##" class="js-change-status" id="change-status-1">Complete</a></li>
			<li><a href="##" class="js-change-status" id="change-status-4">Failed</a></li>
			<li><a href="##" class="js-change-status" id="change-status-2">In Progress</a></li>
			<li><a href="##" class="js-change-status" id="change-status-3">Registered</a></li>
			<li class="divider"></li>
			<li class="nav-header">CERTIFICATES</li>
			<li><a href="##" id="print-cme" class="js-print">CME Certificates</a></li>
			<li><a href="##" id="print-cne" class="js-print">Nurse Certificates</a></li>
		</ul>
	</div>

	<div class="btn-group pull-right pager-simple js-pager-simple">
		<a href="javascript://" class="btn previous js-prev-page<cfif params.page EQ 1> disabled</cfif>"><i class="icon-chevron-left"></i></a>
		<a class="btn dropdown-toggle" data-toggle="dropdown"><span class="js-page-selector">#params.page#</span> <span class="caret"></span></a>

		<ul class="dropdown-menu pages js-pages">
		</ul>
		<a href="javascript://" class="btn next js-next-page"><i class="icon-chevron-right"></i></a>
	</div>
	<div class="btn-group pull-right">
		<a class="btn" data-toggle="dropdown">Filter</a>
		<a class="btn js-attendee-status-title" data-toggle="dropdown">All</a>
		<a class="btn dropdown-toggle" data-toggle="dropdown">
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu js-attendees-filter">
			<li class="attendee-status js-attendee-status js-attendee-status-0" id="status0"><a href="##"><span class="js-attendee-status-name">All</span> <span class="js-attendee-status-count"></span></a></li>
			<li class="divider"></li>
			<li class="attendee-status js-attendee-status js-attendee-status-1" id="status1"><a href="##"><span class="js-attendee-status-name">Complete</span> <span class="js-attendee-status-count"></span></a></li>
			<li class="attendee-status js-attendee-status js-attendee-status-4" id="status4"><a href="##"><span class="js-attendee-status-name">Failed</span> <span class="js-attendee-status-count"></span></a></li>
			<li class="attendee-status js-attendee-status js-attendee-status-2" id="status2"><a href="##"><span class="js-attendee-status-name">In Progress</span> <span class="js-attendee-status-count"></span></a></li>
			<li class="attendee-status js-attendee-status js-attendee-status-3" id="status3"><a href="##"><span class="js-attendee-status-name">Registered</span> <span class="js-attendee-status-count"></span></a></li>
			<li class="js-status-Selected js-attendee-status-Selected" id="statusSelected"><a href="##"><span class="js-attendee-status-name">Selected</span> (<span class="js-attendee-status-selected-count">0</span>)</a></li>
			<li class="js-status-filtered">
            	<form class="form-inline pull-left mll js-attendee-search">
                    <input type="text"  class="input-medium js-attendee-search-typeahead" placeholder="filter people" />
                    <i class="icon-remove js-clear-attendee-search pull-right" style="display: none; position: relative; top: -19px;"></i>
                </form>
    		</li>
		</ul>
	</div>
</div>
<div>
	<div id="RegistrantsContainer" class="js-registrants-container">
    <table border="0" width="620" cellpadding="0" cellspacing="0" class="table">
        <thead>
            <tr>
                <th class="span1"><input type="checkbox" name="CheckAll" id="CheckAll" class="js-check-all" /></th>
                <th class="span2"></th>
                <th class="span4">Name</th>
                <th class="span7">Status</th>
                <th>&nbsp;</th>
            </tr>
        </thead>
        <tbody class="js-attendee-rows">
		
        </tbody>
    </table>
    </div>
</div>
<div class="btn-toolbar clearfix">
    <div class="btn-group pull-right pager-simple js-pager-simple">
            <a href="javascript://" class="btn previous js-prev-page<cfif params.page EQ 1> disabled</cfif>"><i class="icon-chevron-left"></i></a>
            <a class="btn dropdown-toggle" data-toggle="dropdown"><span class="js-page-selector">#params.page#</span> <span class="caret"></span></a>
            <ul class="dropdown-menu page js-pagess">
            </ul>
            <a href="javascript://" class="btn next js-next-page"><i class="icon-chevron-right"></i></a>
	</div>
</div>
#includePartial(partial="mustache/row")#
</cfoutput>
