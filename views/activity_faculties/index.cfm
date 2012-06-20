<div class="btn-toolbar clearfix">
	<div class="btn-group pull-left js-partic-actions">
		<a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="##">SELECTED: <span id="label-status-selected">0</span></a>
		<a class="btn dropdown-toggle disabled" data-toggle="dropdown" href="##">
			Actions
			<span class="caret"></span>
		</a>
		<ul class="dropdown-menu">
			<li><a href="##" class="js-remove-faculty">Remove</a></li>
        </ul>
	</div>
</div>
<cfoutput>
<div>
	<div id="RegistrantsContainer" class="js-faculty-container"></div>
	<div id="RegistrantsLoading" class="Loading js-faculty-loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>
<div class="js-file-uploader"></div>
</cfoutput>