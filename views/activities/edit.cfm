<cfparam name="Attributes.Title" default="">
<cfparam name="Attributes.ActivityID" default="0">
<cfparam name="Attributes.ActivityType" default="1">
<cfparam name="Attributes.StartDate" default="">
<cfparam name="Attributes.StartTime" default="">
<cfparam name="Attributes.EndDate" default="">
<cfparam name="Attributes.EndTime" default="">
<cfparam name="Attributes.Description" default="">
<cfparam name="Attributes.Location" default="">
<cfparam name="Attributes.Address1" default="">
<cfparam name="Attributes.Address2" default="">
<cfparam name="Attributes.City" default="">
<cfparam name="Attributes.State" default="">
<cfparam name="Attributes.Province" default="">
<cfparam name="Attributes.Country" default="230">
<cfparam name="Attributes.PostalCode" default="">
<cfparam name="Attributes.Sessions" default="1">
<cfparam name="Attributes.SessionType" default="S">
<cfparam name="Attributes.Sponsor" default="">
<cfparam name="Attributes.Sponsorship" default="D">
<cfparam name="Attributes.ExternalID" default="">
<cfparam name="Attributes.ReleaseDate" default="#DateFormat(Now(),"MM/DD/YYYY")#">
<cfparam name="Attributes.UpdatedBy" default="">

<cfset qLiveGroupings = Application.Com.GroupingGateway.getByAttributes(ActivityTypeID=1)>
<cfset qEMGroupings = Application.Com.GroupingGateway.getByAttributes(ActivityTypeID=2)>

<cfinclude template="/lib/SaveJS.cfm" />
<script>

<cfoutput>
var LiveOptions = <cfloop query="qLiveGroupings">"<option value=\"#qLiveGroupings.GroupingID#\">#qLiveGroupings.Name#</option>"<cfif qLiveGroupings.RecordCount NEQ qLiveGroupings.CurrentRow> + </cfif></cfloop>;
var EMOptions = <cfloop query="qEMGroupings">"<option value=\"#qEMGroupings.GroupingID#\">#qEMGroupings.Name#</option>"<cfif qEMGroupings.RecordCount NEQ qEMGroupings.CurrentRow> + </cfif></cfloop>;
var nActivityType = #Attributes.ActivityTypeID#;
var nGrouping = #Attributes.GroupingID#;
var sSessionType = "#Attributes.SessionType#";
</cfoutput>
function updateStateProvince(countryId) {
	if(countryId  == 230) {
		$(".stateField").show();
		$(".provinceField").hide();
	} else {
		$(".stateField").hide().css({ display:'none' });
		$(".provinceField").show();
	}
}

function setSessionType(sSessionType) {
	if(sSessionType == "M") {
			$(".Sessions").fadeIn();
			$(".SingleSession").fadeOut();
		} else {
			$(".Sessions").fadeOut();
			$(".SingleSession").fadeIn();
		}
}

function setActivityType(nActivity) {
	
	if(nActivity == 1) {
		$("#Grouping").html(LiveOptions);
		$("#Groupings").fadeIn();
		$(".Location").fadeIn();
	} else if(nActivity == 2) {
		$("#Groupings").fadeIn();
		$("#Grouping").html(EMOptions);
	} else {
		$("#Groupings").fadeOut();
		$("#Grouping").html("");
		$(".Location").fadeOut();
	}
	updateStateProvince($("#Country").val());
}
$(document).ready(function(){
	updateStateProvince($("#Country").val());
	
	$("#Country").bind("change", this, function() {
		updateStateProvince($(this).val());
	});
	
	$(".DatePicker").datepicker({ 
		showOn: "button", 
		buttonImage: "/admin/_images/icons/calendar.png", 
		buttonImageOnly: true,
		showButtonPanel: true,
		changeMonth: true,
		changeYear: true,
		onSelect: function() {
			Unsaved();
			AddChange($("label[for='" + this.id + "']").html(),$(this).val());
		}

	});
	
	$("#Title").autocomplete(sRootPath + '/_com/AJAX_Activity.cfc?method=AutoComplete&returnformat=plain');
	$("#Sponsor").autocomplete(sRootPath + '/_com/AJAX_Activity.cfc?method=JointlyAutoComplete&returnformat=plain');
	
	$("#ActivityType").bind("change", this, function() {
		setActivityType($(this).val());
	});
	
	$("#SessionType").change(function() {
		setSessionType($(this).val());
	});
	
	<cfif Attributes.ActivityType NEQ "">
	$("#ActivityType").val(nActivityType);
	setActivityType($("#ActivityType").val());
		<cfif Attributes.GroupingID NEQ "">
	$("#Grouping").val(nGrouping);
		</cfif>
	</cfif>
	
	<cfif Attributes.SessionType NEQ "">
		$("#SessionType").val(sSessionType);
		setSessionType($("#SessionType").val());
	</cfif>
	
	/* CHECK IF SPONSORSHIP IS JOINTLY OR DIRECTLY START */
	if($("#SponsorshipJ").attr("checked")) {
		$("#JointlyTextFld").css("display","");
	}
	
	$(".Sponsorship").bind("click", function() {
		if($("#SponsorshipJ").attr("checked")) {
			$("#JointlyTextFld").css("display","");
		} else if($("#SponsorshipD").attr("checked")) {
			$("#JointlyTextFld").css("display","none");
		}
	});
	/* CHECK IF SPONSORSHIP IS JOINTLY OR DIRECTLY END */
});
</script>
<cfquery name="qModified" datasource="#Application.Settings.DSN#">
	SELECT     
		A.CreatedBy AS CreatedByID, 
		LEFT(P1.firstname, 1) + '. ' + P1.lastname AS CreatedByName, 
		A.UpdatedBy AS UpdatedByID, 
		LEFT(P2.firstname, 1) + '. ' + P2.lastname AS UpdatedByName
	FROM         ce_Activity AS A 
	LEFT OUTER JOIN
		ce_person AS P2 ON A.UpdatedBy = P2.personid 
	LEFT OUTER JOIN
		ce_person AS P1 ON A.CreatedBy = P1.personid
	WHERE A.ActivityID=<cfqueryparam value="#Attributes.ActivityID#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfoutput>
<div class="ViewContainer">
<div class="ViewSection">
<h3>General Information</h3>
	<form action="/_com/AJAX_Activity.cfc" method="post" name="frmEditActivity" id="EditForm">
		<fieldset class="common-form">
    	<cfinclude template="/lib/SaveInfo.cfm" />
		<!--- ADDED Attributes.SessionType HIDDEN FIELD FOR SAVING PURPOSES [Attributes.SessionType must be passed to save StartDate/EndDate] --->
        <input type="hidden" value="saveActivity" name="Method" />
        <input type="hidden" value="plain" name="returnFormat" />
        <input type="hidden" value="#Attributes.ActivityID#" name="ActivityID" />
    	<input type="hidden" value="#Attributes.SessionType#" name="SessionType" />
		<input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
		<input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
		<table cellspacing="2" cellpadding="3" border="0">
			<tr>
				<td valign="top"><label for="Title">Title</label></td>
				<td><textarea name="Title" rows="2" id="Title" style="width: 495px; height: 36px;">#HTMLSafe(Attributes.Title)#</textarea></td>
			</tr>
			<tr>
				<td valign="top"><label for="ActivityType">Activity Type</label></td>
				<td valign="top">
					<select name="ActivityTypeID" id="ActivityType" disabled="disabled">
						<cfloop query="qActivityTypeList">
							<option value="#qActivityTypeList.ActivityTypeID#" <cfif Attributes.ActivityTypeID EQ qActivityTYpeList.ActivityTypeID> SELECTED</cfif>>#qActivityTypeList.Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr id="Groupings">
				<td><label for="Grouping">Grouping</label></td>
				<td><select name="Grouping" id="Grouping" disabled="disabled"></select></td>
			</tr>
			<tr>
				<td><label for="SessionType">Session Info</label></td>
				<td>
					<select name="SessionType" id="SessionType" disabled="disabled">
						<option value="S"<cfif Attributes.SessionType EQ "S"> SELECTED</cfif>>Stand-alone</option>
						<option value="M"<cfif Attributes.SessionType EQ "M"> SELECTED</cfif>>Multi-session</option>
					</select>
				</td>
			</tr>
			<tr style="display: none;">
				<td><label for="ReleaseDate">Release Date</label></td>
				<td><input type="text" name="ReleaseDate" id="ReleaseDate" value="#Attributes.ReleaseDate#" class="DatePicker" /></td>
			</tr>
			<tr>
				<td><label for="Sponsorship">Sponsorship</label></td>
				<td>
					<input type="radio" name="Sponsorship" class="Sponsorship" id="SponsorshipD"<cfif Trim(Attributes.Sponsorship) EQ "D"> checked="checked"</cfif> value="D" /><label for="SponsorshipD"> Directly</label><br />
					<input type="radio" name="Sponsorship" class="Sponsorship" id="SponsorshipJ"<cfif Trim(Attributes.Sponsorship) EQ "J"> checked</cfif> value="J" /><label for="SponsorshipJ"> Jointly</label><span id="JointlyTextFld" style="display:none;"><label for="Sponsor" style="display:none;">Sponsor</label><input style="margin-left:6px;" type="text" name="Sponsor" id="Sponsor" value="#Attributes.Sponsor#" /></span></td>
			</tr>
			<tr>
				<td><label for="StartDate">Start Date</label></td>
				<td><input type="text" name="StartDate" id="StartDate" value="#Attributes.StartDate#" class="DatePicker" /></td>
			</tr>
			<tr>
				<td><label for="EndDate">End Date</label></td>
				<td><input type="text" name="EndDate" id="EndDate" value="#Attributes.EndDate#" class="DatePicker" /></td>
			</tr>
			<tr class="Location">
				<td><label for="Location">Location</label></td>
				<td><input type="text" name="Location" id="Location" value="#Attributes.Location#" /></td>
			</tr>
			<tr class="Location">
				<td><label for="Address1">Address 1</label></td>
				<td><input type="text" name="Address1" id="Address1" value="#Attributes.Address1#" /></td>
			</tr>
			<tr class="Location">
				<td><label for="Address2">Address 2</label></td>
				<td><input type="text" name="Address2" id="Address2" value="#Attributes.Address2#" /></td>
			</tr>
			<tr class="Location">
				<td><label for="City">City</label></td>
				<td><input type="text" name="City" id="City" value="#Attributes.City#" /></td>
			</tr>
			<tr class="Location stateField">
				<td><label for="State">State</label></td>
				<td>
					<select id="State" name="State">
						<option value="0">Select one...</option>
						<cfloop query="Application.List.States">
							<option value="#trim(Application.List.States.StateId)#"<cfif Attributes.State EQ trim(Application.List.States.StateId)> Selected</cfif>>#Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr class="Location provinceField">
				<td><label for="Province">State / Province</label></td>
				<td><input type="text" name="Province" id="Province" value="#Attributes.Province#" /></td>
			</tr>
            <tr class="Location">
            	<td><label for="Country">Country</label></td>
                <td>
					<select id="Country" name="Country">
						<option value="0">Select one...</option>
						<cfloop query="Application.List.Countries">
							<option value="#trim(Application.List.Countries.CountryID)#"<cfif Attributes.Country EQ trim(Application.List.Countries.CountryID) OR Attributes.Country EQ "" AND trim(Application.List.Countries.Name) EQ "United States of America"> Selected</cfif>>#Name#</option>
						</cfloop>
					</select>
                </td>
            </tr>
			<tr class="Location">
				<td><label for="PostalCode">Postal Code</label></td>
				<td><input type="text" name="PostalCode" id="PostalCode" value="#Attributes.PostalCode#" /></td>
			</tr>
			<tr>
				<td><label for="ExternalID">External ID</label></td>
				<td><input type="text" name="ExternalID" id="ExternalID" value="#Attributes.ExternalID#" /></td>
			</tr>
			<tr>
				<td>Created By</td>
				<td>
					<a href="#request.myself#Person.Detail?PersonID=#qModified.CreatedByID#">#qModified.CreatedByName#</a> (#DateFormat(ActivityBean.getCreated(),"mm/dd/yyyy")# #TimeFormat(ActivityBean.getCreated(),"hh:mmTT")#)
				</td>
			</tr>
			<cfif Attributes.UpdatedBy NEQ "">
				<tr>
					<td>Updated By</td>
					<td>
						<a href="#request.myself#Person.Detail?PersonID=#qModified.UpdatedByID#">#qModified.UpdatedByName#</a> (#DateFormat(ActivityBean.getUpdated(),"mm/dd/yyyy")# #TimeFormat(ActivityBean.getUpdated(),"hh:mmTT")#)
					</td>
				</tr>
			</cfif>
		</table>
		</fieldset>
  	</form>
</div>
</div>
</cfoutput>
