<cfoutput>
#startFormTag(name="frmImportData",method="post",multipart=true,controller="activity_participants",action="upload_csv",key="#params.key#")#
<form name="frmImportData" method="post" action="/activity_participants/upload_csv" enctype="multipart/form-data">
	<input type="hidden" name="filefield" value="uploadfield" />
	<input type="hidden" name="activityid" value="#params.key#" />
	<input type="hidden" name="method" value="upload" />
	<input type="file" name="uploadfield" />
	<input type="checkbox" name="sendemail" value="1" checked="checked" /> Send Emails
	<input type="submit" name="submit" value="Upload" class="btn btn-primary" />
#endFormTag()#
</cfoutput>