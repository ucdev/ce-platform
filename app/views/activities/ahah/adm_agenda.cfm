<cfsetting showdebugoutput="no" />
<script>
$(document).ready(function (){
	var nAgendaID = 0;
	var sAddDate = '';
	
	function continueSaveAgenda() {
		$.post(sRootPath + "/_com/AJAX_Activity.cfc",
			{
				method: "saveAgendaItem",
				AgendaID: $("#frmSaveAgenda #AgendaID").val(),
				ActivityID: nActivity,
				Description: $("#frmSaveAgenda #Description").val(),
				EventDate: $("#frmSaveAgenda #EventDate").val(),
				StartTime: $("#frmSaveAgenda #StartTime").val(),
				EndTime: $("#frmSaveAgenda #EndTime").val(),
				returnFormat:"plain"
			},
			function(returnData) {
				cleanData = $.trim(returnData);
				status = $.ListGetAt(cleanData,1,"|");
				statusMsg = $.ListGetAt(cleanData,2,"|");
				if(status == 'Fail') {					
					addError(statusMsg,250,6000,4000);
				} else {
					$("#ItemDialog").dialog("close");
					updateAgenda();
					addMessage(statusMsg,250,6000,4000);
				}
			});
	};
	
	$("#ItemDialog").dialog({ 
		title:"Agenda Item",
		modal: true, 
		autoOpen: false,
		resizable: false,
		height:185,
		width:350,
		overlay: { 
		opacity: 0.5, 
		background: "black" 
	},
		buttons: { 
			Save:function() {
				continueSaveAgenda();
			}, 
			Cancel:function() {
				$("#ItemDialog").dialog("close");
			}
		},
		open:function() {
			$("#Loading").show();
			$.post(sMyself + "Activity.AgendaForm", { AgendaID: nAgendaID, EventDate: sAddDate  },
			  function(data){
				$("#FormArea").html(data);
				$("#Loading").hide();
			  });
			$("#ItemDialog").show();
		},
		close:function() {
			nAgendaID = 0;
			$("#ItemDialog").hide();
			$("#ItemDialog .WaitMessage").show();
			$("#ItemDialog .FormContainer").empty();
		}
	});
	
	$(".AddItemLink").click(function() {
		sAddDate = $(this).attr('id');
		$("#ItemDialog").dialog("open");
	});
	
	$(".AgendaEditLink").click(function() {
		nAgendaID = $.Replace($(this).attr('id'),'AgendaLink','');
		$("#ItemDialog").dialog("open");
	});
	
	$(".AgendaDeleteLink").click(function() {
		nAgendaID = $.Replace($(this).attr('id'),'AgendaDelete','');
		
		if(confirm('Are you sure you want to delete this agenda item?')) {
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: "deleteAgendaItem", AgendaID: nAgendaID, returnFormat: "plain" },
				function(data){
			  		if(data.STATUS) {
						updateAgenda();
						addMessage(data.STATUSMSG,250,6000,4000);
					}
			});
		}
	});
	
});
</script>

<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
	<div class="ContentBody">
		<cfset StartDate = ActivityBean.getStartDate()>
        <cfset EndDate = ActivityBean.getEndDate()>
        
        <cfif StartDate EQ "" OR EndDate EQ "">
            <cfset StartDate = ActivityBean.getReleaseDate()>
            <cfset EndDate = ActivityBean.getReleaseDate()>
        </cfif>
        
        <cfloop from="#StartDate#" to="#EndDate#" index="i">
            <div style="font-size:15px; font-weight:bold; padding:8px 3px 3px 3px;">#DateFormat(i,'mmmm dd, yyyy')#</div>
            <cfset qItems = Application.Com.AgendaGateway.getByAttributes(ActivityID=Attributes.ActivityID,EventDate=i,OrderBy="StartTime,EndTime")>
            <cfif qItems.RecordCount GT 0>
            <table width="500" cellspacing="1" cellpadding="2" border="0" class="ViewSectionGrid">
                <cfloop query="qItems">
                <tr>
                    <td width="120">#TimeFormat(qItems.StartTime,'h:mmTT')# - #TimeFormat(qItems.EndTime,'h:mmTT')#</td>
                    <td>#qItems.Description#</td>
                    <td align="right" width="50"><a href="javascript:void(0);" id="AgendaLink#qItems.AgendaID#" class="AgendaEditLink"><img src="#Application.Settings.RootPath#/_images/icons/Pencil.png" border="0" /></a> <a href="javascript:void(0);" id="AgendaDelete#qItems.AgendaID#" class="AgendaDeleteLink"><img src="#Application.Settings.RootPath#/_images/icons/Delete.png" border="0" /></a></td>
                </tr>
                </cfloop>
            </table>
            </cfif>
			<div><a href="javascript:void(0);" id="#DateFormat(i,'mm-dd-yyyy')#" class="AddItemLink" style="text-decoration:none; font-size:15px;"><img src="#Application.Settings.RootPath#/_images/icons/Add.png" border="0" align="left" style="padding-right:4px;" />Add Items</a></div>
        </cfloop>
    </div>
</div>
</div>
</cfoutput>