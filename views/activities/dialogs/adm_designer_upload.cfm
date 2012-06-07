<cfparam name="Attributes.FileID" default="" />
<script>
<cfoutput>
var nFileID = 0;
</cfoutput>
$(document).ready(function() {
/* FILE UPLOAD DIALOG */
	$("#FileUploader").dialog({ 
		title:"Upload File",
		modal: true, 
		autoOpen: false,
		height:150,
		width:285,
		resizable: false,
		buttons: { 
			Save:function() {
				$("#frmFileUpload").ajaxSubmit({
					beforeSubmit:  function() {	
						
					}, 
					url: sMyself + "File.Upload?Mode=PublishActivity&ModeID=" + nActivity + "&ActivityID=" + nActivity + "&Submitted=1",
					type: "post",
					success: function(responseText,statusText) {
						$("#FileUploader").html("");
						sResponse = $.Trim(responseText);
						/*console.log(sResponse);*/
						nFileID = $.ListGetAt(sResponse,2,'|');
						$("#FileUploader").dialog("close");
						updateFile(nFileID);
					}
				}); 
			},
			Cancel:function() {
				$(this).dialog("close");
				updateFile(nFileID);
				updateBuilder();
			}
		},
		open:function() {
			$.post(sMyself + "File.Upload", { Mode: "PublishActivity", ModeID: nActivity, ActivityID: nActivity, FileCaption: $("#DisplayName").val() }, 
				function(data) {
					$("#FileUploader").html(data);
			});
		},
		close:function() {
			updateBuilder();
			updateActions();
		}
	});
	
	/* // END NOTES DIALOG */
	
	$("#FileUploadLink").click(function() {
		$("#FileUploader").dialog("open");
	});
});
</script>
<cfoutput>
<input type="hidden" name="FileID" id="FileID" value="#Attributes.FileID#" />
<cfif isNumeric(Attributes.FileID) AND Attributes.FileID GT 0>
	<div style="height:5px;"></div><a href="#myself#File.Download?Mode=Activity&ModeID=#Attributes.ActivityID#&ID=#Attributes.FileID#" id="FileDownloadLink" style="text-decoration:none;font-size:12px;padding:3px;"><img src="#Application.Settings.RootPath#/_images/icons/disk.png" align="absmiddle" style="padding-right:2px;" />#FileBean.getFileName()#</a><div style="height:5px;"></div><a href="javascript:void(0);" id="FileUploadLink" style="text-decoration:none;font-size:12px;padding:3px;"><img src="#Application.Settings.RootPath#/_images/icons/ActionFIU.png" align="absmiddle" style="padding-right:2px;" />Upload New</a>
<cfelse>
	<a href="javascript:void(0);" id="FileUploadLink" style="text-decoration:none;font-size:12px; padding:3px;"><img src="#Application.Settings.RootPath#/_images/icons/ActionFIU.png" align="absmiddle" style="padding-right:2px;" />Upload Now</a>
</cfif>
</cfoutput>