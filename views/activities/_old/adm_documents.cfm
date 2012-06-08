<cfparam name="qFiles.FileUpdated" default="" />
<script>
	var nId = 0;
	
	function updateDocs() {
		$("#DocsLoading").show();
		$.post(sMyself + "Activity.DocsAHAH?ActivityID=" + nActivity, function(data) {
			$("#DocsContainer").html(data);
			$("#DocsLoading").hide();
		});
	}
	
	$(document).ready(function() {
		updateDocs();
		<!--- $().ajaxStart(function(){
			$.blockUI({ message: '<h1>Updating information...</h1>'});
		});
				
		$().ajaxStop(function(){
			$.unblockUI();
		}); --->
		
		$("#UploadDialog").dialog({ 
			title:"Upload File",
			modal: false, 
			autoOpen: false,
			height:246,
			width:285,
			resizable: false,
			stack: false,
			buttons: { 
				Save:function() {
					$("#frmFileUpload").ajaxSubmit({
						beforeSubmit:  function() {		// pre-submit callback 
							
						}, 
						url: sMyself + "File.Upload&Mode=Activity&ModeID=" + nActivity + "&ActivityID=" + nActivity + "&Submitted=1",
						type: "post",
						success: function() {			// post-submit callback 
							$("#UploadDialog").html("");
							addMessage("File uploaded successfully.",250,6000,4000);
							$("#UploadDialog").dialog("close");
							updateDocs();
						}
					}); 
				},
				Cancel:function() {
					$(this).dialog("close");
					updateDocs();
				}
			},
			open:function() {
				$.post(sMyself + "File.Upload?Mode=Activity&ModeID=" + nActivity + "&ActivityID=" + nActivity, function(data) {
					$("#UploadDialog").html(data);
				});
			},
			close:function() {
				updateDocs();
				updateActions();
			}
		});
		
		$(".UploadLink").click(function() {
			$("#UploadDialog").dialog("open");
		});
		
		/* REMOVE ONLY CHECKED */
		$("#RemoveChecked").bind("click",function() {
			if(confirm("Are you sure you want to remove the checked documents from this Activity?")) {
				var result = "";
				var cleanData = "";
				$(".DocCheckbox:checked").each(function () {
					result = $.ListAppend(result,$(this).val(),",");
				});
				
				$.post(sRootPath + "/_com/File/FileAjax.cfc", { method: "removeChecked", DocList: result, ActivityID: nActivity, returnFormat: "plain" },
				function(returnData) {
					cleanData = $.trim(returnData);
					status = $.ListGetAt(cleanData,1,"|");
					statusMsg = $.ListGetAt(cleanData,2,"|");
					
					if(status == 'Success') {
						updateDocs();
						addMessage(statusMsg,250,6000,4000);
					} else {
						addError(statusMsg,250,6000,4000);
					}
				});
			}
		});
		
		/* REMOVE ALL FILES FROM Activity */
		$("#RemoveAll").bind("click",function() {
			if(confirm("WARNING!\nYou are about to remove ALL files from this Activity!\nAre you sure you wish to continue?")) {
				var cleanData = "";

				$.post(sRootPath + "/_com/File/FileAjax.cfc", { method: "removeAll", ActivityID: nActivity, returnFormat: "plain" },
				function(returnData) {
					cleanData = $.trim(returnData);
					status = $.ListGetAt(cleanData,1,"|");
					statusMsg = $.ListGetAt(cleanData,2,"|");
					
					if(status == 'Success') {
						updateDocs();
						addMessage(statusMsg,250,6000,4000);
					} else {
						addError(statusMsg,250,6000,4000);
					}
				});
			}
		});
		
		$("#CheckAll").click(function() {
			if($("#CheckAll").attr("checked")) {
				$(".DocCheckbox").each(function() {
					$(this).attr("checked",true);
				});
			} else {
				$(".DocCheckbox").each(function() {
					$(this).attr("checked",false);
				});
			}
		});
	});
</script>
<cfoutput>
<div class="ViewSection">
	<h3>Documents</h3>
	<div id="DocsContainer"></div>
	<div id="DocsLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div>
	</div>
</div>
<div id="UploadDialog">

</div>
</cfoutput>