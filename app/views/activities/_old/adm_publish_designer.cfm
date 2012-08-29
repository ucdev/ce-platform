<cfparam name="Attributes.Overview" default="" />
<cfparam name="Attributes.Keywords" default="" />
<cfparam name="Attributes.Objectives" default="" />
<cfparam name="Attributes.Goals" default="" />
<cfparam name="Attributes.PublishDate" default="" />
<cfparam name="Attributes.RemoveDate" default="" />

<script>
var nPubCompID = 0;

function updateBuilder() {
	$("#BuildLoading").show();
	$.post(sMyself + "Activity.PubComponents", { ActivityID: nActivity },
		function(data) {
			$("#BuildContainer").html(data);
			$("#BuildLoading").hide();
	});
}

function updateFile(nFileID) {
	$.post(sMyself + "Activity.BuilderFileUploader", { ActivityID: nActivity, FileID: nFileID },
		function(data) {
			$("#FileForm").html(data);
	});
}

$(document).ready(function() {
	updateBuilder();
	
	$("#ComponentList").dialog({ 
		title:"Select a component",
		modal: true, 
		autoOpen: false,
		height:150,
		width:560,
		resizable: false,
		position:[13,198],
		open:function() {
			$("#ComponentList").show();
		},
		close:function() {
			
		}
	});
	
	$("#btnAdd").live("click", function() {
		$("#ComponentList").dialog("open");
	});
	
	$("a.ComponentAddLink").live("click", function() {
		var sType = $.ListGetAt(this.id,3,'|');
		var nComponentID = $.ListGetAt(this.id,2,'|');

		$("#" + sType + "Dialog").dialog("open");
	});
	
	var Options = {
		beforeSubmit: function(){
			
		},
		success:function(responseText,statusText) {
			var d = new Date();
			
			if($.Trim(responseText) != 'success') {
				addError(responseText,250,6000,4000);
			} else {
				window.location = sMyself + 'activity.pubBuilder?activityId=' + nActivity;
				<!--- COMMENTED OUT DUE TO SAVE BUTTON BINDING ISSUES IN FIREFOX // 3/2/2011 - JS
				updateActions();
				updateBuilder();
				$(".CompDialog").dialog("close");--->
			}
		}
	}
	
	var DialogButtons = {
			Save:function() {
				$("#frmComp").ajaxSubmit(Options);
			},
			Cancel:function() {
				$(this).dialog("close");
			}
		}
	
	$("#TXDialog").dialog({ 
		title:"Text Block",
		modal: true, 
		autoOpen: false,
		height:400,
		width:620,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderTX", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#TXDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#TXDialog").html("");
		}
	});
	
	$("#HD1Dialog").dialog({ 
		title:"Header 1",
		modal: true, 
		autoOpen: false,
		height:80,
		width:450,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderHD1", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#HD1Dialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#HD1Dialog").html("");
		}
	});
	
	$("#HD2Dialog").dialog({ 
		title:"Header 2",
		modal: true, 
		autoOpen: false,
		height:80,
		width:450,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderHD2", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#HD2Dialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#HD2Dialog").html("");
		}
	});
	
	$("#HD3Dialog").dialog({ 
		title:"Header 3",
		modal: true, 
		autoOpen: false,
		height:80,
		width:450,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderHD3", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#HD3Dialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#HD3Dialog").html("");
		}
	});
	
	$("#AUDDialog").dialog({ 
		title:"File Download",
		modal: true, 
		autoOpen: false,
		height:400,
		width:600,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderAUD", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#AUDDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#AUDDialog").html("");
		}
	});
	
	$("#VIDDialog").dialog({ 
		title:"File Download",
		modal: true, 
		autoOpen: false,
		height:400,
		width:600,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderVID", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#VIDDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#VIDDialog").html("");
		}
	});
	
	$("#ECDialog").dialog({ 
		title:"External Content",
		modal: true, 
		autoOpen: false,
		height:400,
		width:620,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderEC", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#ECDialog").html(data);
					$("#frmComp").submit(function() {
						var ed = tinyMCE.get('content');
						$("#Description").val(ed.getContent());
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#ECDialog").html("");
		}
	});
	
	$("#STDialog").dialog({ 
		title:"Statement",
		modal: true, 
		autoOpen: false,
		height:400,
		width:450,
		resizable: false,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
		},
		close:function() {
			
		}
	});
	
	$("#FDDialog").dialog({ 
		title:"File Download",
		modal: true, 
		autoOpen: false,
		height:400,
		width:600,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderFD", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#FDDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#FDDialog").html("");
		}
	});
	
	$("#FVDialog").dialog({ 
		title:"Document Viewer",
		modal: true, 
		autoOpen: false,
		height:400,
		width:600,
		resizable: false,
		buttons:DialogButtons,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderFV", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#FVDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#FVDialog").html("");
		}
	});
	
	$("#PAYDialog").dialog({ 
		title:"Payment Module",
		modal: true, 
		autoOpen: false,
		height:400,
		width:450,
		resizable: false,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
		},
		close:function() {
			
		}
	});
	
	$("#ASPRDialog").dialog({ 
		title:"Assessment (Pre Test)",
		modal: true, 
		autoOpen: false,
		height:470,
		width:640,
		resizable: false,
		buttons:{
			Save:function() {
				$("#frmComp-" + $(this).data('pubCompId')).ajaxSubmit(Options);
			},
			Cancel:function() {
				$(this).dialog("close");
			}
		},
		position:[100,40],
		open:function() {
			$(this).data('pubCompId',nPubCompID);
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderASPR", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#ASPRDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#ASPRDialog").html("");
		}
	});
	
	$("#ASPODialog").dialog({ 
		title:"Assessment (Post Test)",
		modal: true, 
		autoOpen: false,
		height:470,
		width:640,
		resizable: false,
		buttons:{
			Save:function() {
				$("#frmComp-" + $(this).data('pubCompId')).ajaxSubmit(Options);
			},
			Cancel:function() {
				$(this).dialog("close");
			}
		},
		position:[100,40],
		open:function() {
			$(this).data('pubCompId',nPubCompID);
			$("#ComponentList").dialog("close");
			$.post(sMyself +"Activity.BuilderASPO", { ActivityID: nActivity, PubComponentID: nPubCompID }, 
				function(data) {
					$("#ASPODialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#ASPODialog").html("");
		}
	});
	
	$("#ASEVDialog").dialog({ 
		title:"Assessment (Eval)",
		modal: true, 
		autoOpen: false,
		height:415,
		width:620,
		resizable: false,
		buttons:{
			Save:function() {
				$("#frmComp-" + $(this).data('pubCompId')).ajaxSubmit(Options);
			},
			Cancel:function() {
				$(this).dialog("close");
			}
		},
		position:[100,40],
		open:function() {
			$(this).data('pubCompId',nPubCompID);
			
			$("#ComponentList").dialog("close");
			$.post(sMyself + "Activity.BuilderASEV", 
					{ 
					ActivityID: nActivity, 
					PubComponentID: nPubCompID 
					}, 
				function(data) {
					$("#ASEVDialog").html(data);
					$("#frmComp").submit(function() {
						$("#frmComp").ajaxSubmit(Options); 
						return false;
					});
			});
		},
		close:function() {
			nPubCompID = 0;
			$("#ASEVDialog").html("");
		}
	});
	
	$("#TADialog").dialog({ 
		title:"Terms",
		modal: true, 
		autoOpen: false,
		height:400,
		width:450,
		resizable: false,
		position:[100,100],
		open:function() {
			$("#ComponentList").dialog("close");
		},
		close:function() {
			
		}
	});

	
});
</script>

<cfoutput>
<link href="#Application.Settings.RootPath#/_styles/Builder.css" rel="stylesheet" type="text/css" />
<div class="ViewSection">
	<h3>Builder</h3>
	<div class="ViewSectionButtons"><input type="button" value="Add Component" name="btnAdd" id="btnAdd" /> <input type="button" value="Preview" name="btnPreview" id="btnPreview" /><span class="SaveInfo" id="SaveInfo"></span></div>
	<div id="BuildContainer"></div>
	<div id="BuildLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>

<!--- DIALOGS --->
<div id="ComponentList">
	<cfloop query="qComponents">
	<div class="ComponentItem #Trim(qComponents.TypeCode)#"><a href="javascript:void(0);" class="ComponentAddLink" id="Add|#qComponents.ComponentID#|#Trim(qComponents.TypeCode)#">#qComponents.Name#</a></div>
	<div class="ComponentDesc">#qComponents.Description#</div>
	</cfloop>
</div>
<cfloop query="qComponents">
<div id="#Trim(qComponents.TypeCode)#Dialog" class="CompDialog">
	
</div>
</cfloop>
<div id="QuestionListDialog">

</div>
<div id="QuestionDialog">

</div>
<div id="FileUploader">
</div>
</cfoutput>