<cfoutput>
<form name="frmImportData" method="post" action="/admin/_com/attendee_import.cfc" enctype="multipart/form-data">
	<input type="hidden" name="filefield" value="uploadfield" />
	<input type="hidden" name="activityid" value="#attributes.activityid#" />
	<input type="hidden" name="method" value="upload" />
	<input type="file" name="uploadfield" />
	<input type="checkbox" name="sendemail" value="1" checked="checked" /> Send Emails
	<input type="submit" name="submit" value="process" />
</form>
</cfoutput>