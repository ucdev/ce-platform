<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveJS.cfm" />

<script>
// GATHERS PERSON SPECIALTIES
function getActivitySpecialties(nActivity) {
	$.getJSON(sRootPath + "/_com/AJAX_activity.cfc", { method: "getActivitySpecialties", activityId: nActivity, returnFormat: "plain" },
		function(data) {
		if($.ArrayLen(data.DATASET) > 0) {
			$.each(data.DATASET, function(i, item) {
				$("#Specialty" + item.SPECIALTYID).attr("checked",true);
				updateSpecialtyOption(item.SPECIALTYID)
			});
		}
	});
}
	
// GATHERS SPECIALTIES
function getSpecialties() {
	$.getJSON(sRootPath + "/_com/AJAX_activity.cfc", { method: "getSpecialties", returnFormat: "plain" },
		function(data) {
		
		if($.ArrayLen(data.DATASET) > 0) {
			var $specialtytemplate = $("#specialty-template").html();
			var $specialtyoutput = "";
			
			$.each(data.DATASET, function(i, item) {
				$specialtyoutput = $specialtyoutput + $specialtytemplate.replace(/%specialtyId%/gi,item.SPECIALTYID);
				$specialtyoutput = $specialtyoutput.replace('%name%',item.NAME);
			});
			
			$(".specialties p").html($specialtyoutput);
		} else {
			addError(data.STATUSMSG,250,6000,4000);
		}
	});
}
	
// STYLIZES THE SPECIALTY DIVS
function updateSpecialtyOption(nId) {
		if($("#specialty-" + nId).is('.formOptionSelected')) {
			$("#specialty-" + nId).removeClass("formOptionSelected");
		} else {
			$("#specialty-" + nId).addClass("formOptionSelected");
		}
}


$(document).ready(function() {
	getSpecialties();
	getActivitySpecialties(nActivity);
	
	$(".specialtyOption").live("change",function() {
		var nSpecialty = $.ListGetAt(this.id, 2, "-");
		updateSpecialtyOption(nSpecialty);
	});
});

// CHANGE SPECIALTYCONTAINER'S CSS
function setSpecialtyStyle(SpecialtyStatus, ContainerID) {
	if(SpecialtyStatus) {
		$("#" + ContainerID).css({"background-color": "#4E9A30", "color": "#FFFFFF", "border": "1px solid #1B6700"});
	} else {
		$("#" + ContainerID).css({"background-color": "#FFFFFF", "color": "#000000", "border": "1px solid #FFFFFF"});
	}	
}
</script>

<cfoutput>
<form name="frmSpecialties" id="EditForm" method="post" action="#Application.Settings.RootPath#/_com/AJAX_Activity.cfc">
<input type="hidden" value="saveSpecialties" name="method" id="method" />
<input type="hidden" value="plain" name="returnformat" />
<input type="hidden" value="#Attributes.ActivityID#" name="ActivityID" />
<input type="hidden" value="" name="ChangedFields" id="ChangedFields" />
<input type="hidden" value="" name="ChangedValues" id="ChangedValues" />
<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveInfo.cfm" />
<p><strong>Currently under development, should be finished shortly.</strong></p>
<div class="specialties">
    <p>
    </p>
        <input type="hidden" name="Submitted" value="1" />
</div>
</form>
<div id="specialty-template" style="display:none;">
	<div class="specialtyOption" id="specialty-%specialtyId%"><input type="checkbox" name="Specialties" id="Specialty%specialtyId%" value="%specialtyId%" /> <label for="Specialty%specialtyId%">%name%</label></div>
</div>
</cfoutput>