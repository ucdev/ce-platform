<script>
	$(document).ready(function() {
	
		$(".UploadLink").click(function() {
			$("#UploadDialog").dialog("open");
		});
		
		$(".PublishLink").bind("click", this, function() {
			var nFile = $.ListGetAt(this.id, 3, "-");
			var nComponent = $.ListGetAt(this.id, 2, "-");
			var sFileName = prompt("What is the display name of this component?");
			
			$.getJSON(sRootPath + '/_com/AJAX_Activity.cfc', { method: 'publishFile', ActivityID: nActivity, FileID: nFile, FileName: sFileName, ComponentID: nComponent, returnFormat: 'plain' },
				function(data) {
				 if(data.STATUS) {
					addMessage(data.STATUSMSG,250,6000,4000);
					updateDocs();
				 } else {
					addError(data.STATUSMSG,250,6000,4000);
				 }
			});
		});
		
		$(".UnpublishLink").bind("click", this, function() {
			var nFile = $.ListGetAt(this.id, 2, "-");
			
			$.post(sRootPath + '/_com/AJAX_Activity.cfc', { method: 'UnpublishFile', ActivityID: nActivity, FileID: nFile, returnFormat: 'plain' },
				function(data) {
				 var cleanData = $.Trim(data);
				 var status = $.ListGetAt(cleanData, 1, "|");
				 var statusMsg = $.ListGetAt(cleanData, 2, "|");
				 
				 if(status == "Success") {
					addMessage(statusMsg,250,6000,4000);
					updateDocs();
				 } else {
					addError(statusMsg,250,6000,4000);
				 }
			});
		});
	});
</script>
<cfoutput>
<cfif qFileList.RecordCount GT 0>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="ViewSectionGrid">
	<cfscript>
	function FileType(path)
	{
	Var fso = CreateObject("COM", "Scripting.FileSystemObject");
	Var theFile = fso.GetFile(path);
	Return theFile.Type;
	}
	</cfscript>
	<cfset FilePath = "#ExpandPath("./_uploads/ActivityFiles/#Attributes.ActivityID#/")#">
	
		<tbody>
		<cfloop query="qFileList">
			<cfset FileType = Right(qFileList.FileName,Len(qFileList.FileName)-Find(".",qFileList.FileName))>
			<tr id="DocRow#qFileList.FileID#" class="AllDocs">
				<td valign="top" style="padding-top:7px;" width="16"><input type="checkbox" name="Checked" class="DocCheckbox" id="Checked#qFileList.FileID#" value="#qFileList.FileID#" /></td>
				<td valign="top" style="padding-top:7px;" width="16"><img src="#Application.Settings.RootPath#/_images/file_icons/#FileType#.png" /></td>
				<td>
					<a href="#Myself#File.Download?Mode=Activity&ModeID=#Attributes.ActivityID#&ID=#qFileList.FileID#" style="text-decoration:none; font-size:15px;"><strong>#qFileList.FileName#</strong></a>
					<div style="font-size:10px; color:##555;">
						"#qFileList.FileCaption#"<br />
						<strong>Document Type:</strong> #qFileList.FileTypeName#<br />
						<strong>Uploaded By:</strong> #qFileList.CreatedByFName# #qFileList.CreatedByLName#
					</div>
				</td>
                <td valign="top"><strong>Public Download Link:</strong><br />
                	<textarea rows="2" style="width:250px; height:35px;">https://ccpd.uc.edu/download/Activity/#Attributes.ActivityID#/#qFileList.FileID#</textarea></td>
				<td align="center"><a href="#Myself#File.Download?Mode=Activity&ModeID=#Attributes.ActivityID#&ID=#qFileList.FileID#" title="Download Document"><img src="#Application.Settings.RootPath#/_images/icons/Disk.png" /></a><a href="#Myself#File.Edit&Mode=Activity&ModeID=#Attributes.ActivityID#&ID=#qFileList.FileID#" title="Edit Details"><img src="#Application.Settings.RootPath#/_images/icons/Pencil.png" /></a></td>
			</tr>
            <cfif qFileList.ComponentCount GT 0>
            	<tr>
                    <td colspan="2">&nbsp;</td>
                	<td colspan="3"><em>Published File</em> || <a href="javascript://" id="Unpublish-#qFileList.FileID#" class="UnpublishLink">Unpublish</a></td>
                </tr>
            <cfelse>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="3">&raquo; <a href="javascript://" id="Publish-3-#qFileList.FileID#" class="PublishLink">Publish to File Download</a> || <a href="javascript://" id="Publish-4-#qFileList.FileID#" class="PublishLink">Publish to Document Viewer</a></td>
                </tr>
            </cfif>
		</cfloop>
	</tbody>
</table>
<cfelse>
<div style="background-image:url(/_images/Sample_Documents.jpg); font-size:18px; text-align:center; height:250px; width:631px;">
	<div style="padding:25px 20px;">You have not uploaded any documents.<br />Click '<a href="javascript:void(0);" class="UploadLink">Upload Document</a>' on the right to begin.</div>
</div>
</cfif>
</cfoutput>