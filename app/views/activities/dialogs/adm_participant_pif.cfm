<cfparam name="Attributes.Saved" default="">
<cfparam name="Attributes.CBAFundID" default="">
<cfparam name="Attributes.CBACDC" default="">
<cfparam name="Attributes.CBAOth" default="">

<cfparam name="Attributes.CBOFundID" default="">
<cfparam name="Attributes.CBOCDC" default="">
<cfparam name="Attributes.CBOOth" default="">

<cfparam name="Attributes.ProfCId" default="99">
<cfparam name="Attributes.ProfCOther" default="">
<cfparam name="Attributes.ProfNId" default="99">
<cfparam name="Attributes.ProfNOther" default="">

<cfparam name="Attributes.FunRCId" default="99">
<cfparam name="Attributes.FunRCOther" default="">
<cfparam name="Attributes.FunRNId" default="99">
<cfparam name="Attributes.FunRNOther" default="">

<cfparam name="Attributes.OccClassID" default="0">
<cfparam name="Attributes.OrgTypeId" default="0">
<cfparam name="Attributes.OrgTypeOther" default="">

<cfparam name="Attributes.PrinEmpID" default="0">
<cfparam name="Attributes.PrinEmpOther" default="">

<cfparam name="Attributes.WorkState" default="0">
<cfparam name="Attributes.WorkZip" default="">

<cfparam name="Attributes.Focus1" default="N">
<cfparam name="Attributes.Focus2" default="N">
<cfparam name="Attributes.Focus3" default="N">
<cfparam name="Attributes.Focus4" default="N">
<cfparam name="Attributes.Focus5" default="N">
<cfparam name="Attributes.Focus6" default="N">
<cfparam name="Attributes.Focus7" default="N">
<cfparam name="Attributes.Focus8" default="N">
<cfparam name="Attributes.Focus9" default="N">
<cfparam name="Attributes.Focus10" default="N">
<cfparam name="Attributes.FocusOther" default="">

<cfparam name="Attributes.SpecialPop1" default="N">
<cfparam name="Attributes.SpecialPop2" default="N">
<cfparam name="Attributes.SpecialPop3" default="N">
<cfparam name="Attributes.SpecialPop4" default="N">
<cfparam name="Attributes.SpecialPop5" default="N">
<cfparam name="Attributes.SpecialPop6" default="N">
<cfparam name="Attributes.SpecialPop7" default="N">
<cfparam name="Attributes.SpecialPop8" default="N">
<cfparam name="Attributes.SpecialPop9" default="N">
<cfparam name="Attributes.SpecialPop10" default="N">
<cfparam name="Attributes.SpecialPop11" default="N">
<cfparam name="Attributes.SpecialPop12" default="N">
<cfparam name="Attributes.SpecialPop13" default="N">
<cfparam name="Attributes.SpecialPop14" default="N">
<cfparam name="Attributes.SpecialPop15" default="N">
<cfparam name="Attributes.SpecialPop16" default="N">
<cfparam name="Attributes.SpecialPop17" default="N">
<cfparam name="Attributes.SpecialPop18" default="N">
<cfparam name="Attributes.SpecialPopOther" default="">

<cfparam name="Attributes.MarketID" default="0">
<cfparam name="Attributes.MarketOther" default="">
<cfparam name="Attributes.ContactUpdates" default="Y">
<cfparam name="Attributes.ContactEval" default="Y">
<cfparam name="Attributes.PTCAlert" default="Y">
<cfparam name="Attributes.CurrentlyEnrolled" default="FALSE">
<cfparam name="Attributes.PTCTraining" default="FALSE">
<cfparam name="Attributes.PrimaryMotivation" default="FALSE">
<script>
function setOccClass(nId) {
	if (nId == 1) {
		$(".Clinical").show();
		$(".NonClinical").hide();
		$("#ProfNOther").val("");
		$("#ProfNOther").hide();
		$("#FunRNOther").val("");
		$("#FunRNOther").hide();
		$(".NonClinical td input,.NonClinical td select").val("");
	} else if (nId == 2) {
		$(".NonClinical").show();
		$(".Clinical").hide();
		$("#ProfCOther").val("");
		$("#ProfCOther").hide();
		$("#FunRCOther").val("");
		$("#FunRCOther").hide();
		$(".Clinical td input,.Clinical td select").val("");
	} else {
		$(".Clinical").hide();
		$(".Clinical td input,.Clinical td select").val("");
		$("#ProfCOther").val("");
		$("#ProfCOther").hide();
		$("#FunRCOther").val("");
		$("#FunRCOther").hide();
		$(".NonClinical").hide();
		$("#ProfNOther").val("");
		$("#ProfNOther").hide();
		$("#FunRNOther").val("");
		$("#FunRNOther").hide();
		$(".NonClinical td input,.NonClinical td select").val("");
		
	}
	$("#OccClassID").val(nId);

}

function setProfC(nId) {
	if(nId == 7) {
		$("#ProfCOther").fadeIn();
	} else {
		$("#ProfCOther").fadeOut();
		$("#ProfCOther td input").val("");
	}
	$("#ProfCID").val(nId);
}

function setProfN(nId) {
	if(nId == 10) {
		$("#ProfNOther").fadeIn();
	} else {
		$("#ProfNOther").fadeOut();
		$("#ProfNOther td input").val("");
	}
	
	$("#ProfNID").val(nId);
}

function setFunRC(nId) {
	if(nId == 18) {
		$("#FunRCOther").fadeIn();
	} else {
		$("#FunRCOther").fadeOut();
		$("#FunRCOther td input").val("");
	}
	
	$("#FunRCID").val(nId);
}

function setFunRN(nId) {
	if(nId == 16) {
		$("#FunRNOther").fadeIn();
	} else {
		$("#FunRNOther").fadeOut();
		$("#FunRNOther td input").val("");
	}
	
	$("#FunRNID").val(nId);
}

function setOrgType(nId) {
	if(nId == 27) {
		$("#OrgTypeOther").fadeIn();
	} else {
		$("#OrgTypeOther").fadeOut();
		$("#OrgTypeOther td input").val("");
	}
	$("#OrgTypeID").val(nId);
}

function setPrinEmp(nId) {
	if(nId == 14) {
		$("#PrinEmpOther").fadeIn();
	} else {
		$("#PrinEmpOther").fadeOut();
		$("#PrinEmpOther td input").val("");
	}
	$("#PrinEmpID").val(nId);
}

function setMarket(nId) {
	if(nId == 9) {
		$("#MarketOther").fadeIn();
	} else {
		$("#MarketOther").fadeOut();
		$("#MarketOther td input").val("");
	}
	$("#MarketID").val(nId);
}

var nFocusCount = 0;
function setFocus(oFocus) {
	if($(oFocus).attr("checked")) {
		nFocusCount++;
		if($(oFocus).attr("id") == 'Focus10') {
			$("#FocusOther").attr("disabled",false);
		}
	} else {
		nFocusCount--;
		if($(oFocus).attr("id") == 'Focus10') {
			$("#FocusOther").attr("disabled",true);
		}
	}
	if(nFocusCount == 2) {
		$(".FocusBox").each(function() {
			if(!$(this).attr("checked")) {
				$(this).attr("disabled",true);
			}
		});
	} else {
		$(".FocusBox").attr("disabled",false);
	}
}

var nPopCount = 0;
function setPop(oPop) {
	if($(oPop).attr("checked")) {
		nPopCount++;
		if($(oPop).attr("id") == 'SpecialPop18') {
			$("#PopOther").attr("disabled",false);
		}
	} else {
		if($(oPop).attr("id") == 'SpecialPop18') {
			$("#PopOther").attr("disabled",true);
		}
		nPopCount--;
	}
	if(nPopCount == 3) {
		$(".PopBox").each(function() {
			if(!$(this).attr("checked")) {
				$(this).attr("disabled",true);
			}
		});
	} else {
		$(".PopBox").attr("disabled",false);
	}
}

$(document).ready(function() {	
	$(".FocusBox").click(function() {
		setFocus($(this));
	});
	
	$(".PopBox").click(function() {
		setPop($(this));
	});
	
	$("#OccClassID").change(function() {
		setOccClass($(this).val());
	});
	
	$("#ProfCID").change(function() {
		setProfC($(this).val());
	});
	
	$("#ProfNID").change(function() {
		setProfN($(this).val());
	});
	
	$("#FunRCID").change(function() {
		setFunRC($(this).val());
	});
	
	$("#FunRNID").change(function() {
		setFunRN($(this).val());
	});
	
	$("#OrgTypeID").change(function() {
		setOrgType($(this).val());
	});
	
	$("#PrinEmpID").change(function() {
		setPrinEmp($(this).val());
	});
	
	$("#MarketID").change(function() {
		setMarket($(this).val());
	});
	<cfoutput>
	<cfif Attributes.OccClassID NEQ "">
	setOccClass(#Attributes.OccClassID#);
	</cfif>
	<cfif Attributes.OrgTypeID NEQ "">
	setOrgType(#Attributes.OrgTypeID#);
	</cfif>
	<cfif Attributes.ProfNID NEQ "">
	setProfN(#Attributes.ProfNID#);
	</cfif>
	<cfif Attributes.ProfCID NEQ "">
	setProfC(#Attributes.ProfCID#);
	</cfif>
	<cfif Attributes.FunRCID NEQ "">
	setFunRC(#Attributes.FunRCID#);
	</cfif>
	<cfif Attributes.FunRNID NEQ "">
	setFunRN(#Attributes.FunRNID#);
	</cfif>
	<cfif Attributes.PrinEmpID NEQ "">
	setPrinEmp(#Attributes.PrinEmpID#);
	</cfif>
	<cfif Attributes.MarketID NEQ "">
	setMarket(#Attributes.MarketID#);
	</cfif>
	
	<!--- SET FOCUS DEFAULT --->
	$(".FocusBox:checked").each(function() {
		setFocus($(this));
	});
	
	$(".PopBox:checked").each(function() {
		setPop($(this));
	});
	</cfoutput>
	<cfif Attributes.Saved EQ 1>
		parent.addMessage("<cfoutput>#PersonBean.getFirstName()# #PersonBean.getLastName()#</cfoutput> PIF Form Saved!",250,6000,4000);
		parent.$("#pifForm").dialog("close");
	</cfif>
});
</script>
<style>
table tr td { border-bottom:1px solid #CCC; }
table tr td table tr td { border-bottom:1px solid #EEE; }
.FieldInput table tr td { font-size:10px!important; }
.FieldInput select,.FieldInput input { font-size:10px!important; }
.FieldLabel { width:160px!important; font-size:11px!important; }
</style>
<cfoutput>
<div class="ViewSection">
<form action="#Application.Settings.RootPath#/_com/ajax_activity.cfc" method="get" name="frmCDC" id="frmCDC">
	<input type="hidden" name="method" value="saveAttendeeCDC" />
    <input type="hidden" name="attendeeId" value="#Attributes.AttendeeID#" />
    <input type="hidden" name="CBAFundId" value="#Attributes.CBAFundId#" />
    <input type="hidden" name="CBACDC" value="#Attributes.CBACDC#" />
    <input type="hidden" name="CBAOth" value="#Attributes.CBAOth#" />
    <input type="hidden" name="CBOFundId" value="#Attributes.CBOFundId#" />
    <input type="hidden" name="CBOCDC" value="#Attributes.CBOCDC#" />
    <input type="hidden" name="CBOOth" value="#Attributes.CBOOth#" />
	<h3>#PersonBean.getFirstName()# #PersonBean.getLastName()# PIF FORM <input type="hidden" name="Submitted" value="1"> </h3>
	
		<table width="100%" border="0" cellspacing="1" cellpadding="1" id="PIFFORM">
			<tr>
				<td class="FieldLabel">1. Gender: </td>
				<td class="FieldInput">#PersonBean.getGender()#</td>
			</tr>
			<tr>
				<td class="FieldLabel">2. Ethnicity: </td>
				<td class="FieldInput">
                	<cfset qOMBEthnicity = Application.List.OMBEthnicities>
					<select name="OMBEthnicity" id="OMBEthnicity"<cfif NOT IsEditable> disabled</cfif>>
						<option value=""></option>
						<cfloop query="qOMBEthnicity">
						<option value="#qOMBEthnicity.OMBEthnicityId#"<cfif PersonBean.getOMBEthnicityID() EQ qOMBEthnicity.OMBEthnicityId> selected</cfif>>#qOMBEthnicity.Description#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">3. Racial Background: </td>
				<td class="FieldInput">
					<cfquery name="qEthnicity" datasource="#Application.Settings.DSN#">
						SELECT ethnicityid, description FROM ce_Sys_Ethnicity WHERE description <> 'Hispanic'
					</cfquery>
					<select name="Ethnicity" id="Ethnicity"<cfif NOT IsEditable> disabled</cfif>>
						<option value=""></option>
						<cfloop query="qEthnicity">
						<option value="#qEthnicity.ethnicityid#"<cfif PersonBean.getEthnicityID() EQ qEthnicity.ethnicityid> selected</cfif>>#Replace(qEthnicity.Description,', non-Hispanic','')#</option>
						</cfloop>
					</select>
					
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">4. Occupational Classification: </td>
				<td class="FieldInput">
				<cfset qOccClass = Application.List.OccClass>
				<select name="OccClassID" size="1" id="OccClassID">
					<option value="">Select Class</option>
					<cfloop query="qOccClass">
					<option value="#qOccClass.OccClassID#">#qOccClass.Name#</option>
					</cfloop>
				</select></td>
			</tr>
			<tr class="Clinical" style="display:none;">
				<td nowrap="nowrap" class="FieldLabel">5. Your Profession:</td>
				<td class="FieldInput">
					<cfset qProfC = Application.List.ProfC>
					<select name="ProfCID" id="ProfCID">
						<cfloop query="qProfC">
						<option value="#qProfC.ProfCID#">#qProfC.Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr id="ProfCOther" style="display:none;">
				<td class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profession, other:</td>
				<td class="FieldInput"><input name="ProfCOther" type="text" value="#Attributes.ProfCOther#" maxlength="50" /></td>
			</tr>
			<tr class="Clinical" style="display:none;">
				<td class="FieldLabel">6. Your primary functional role: </td>
				<td class="FieldInput">
				<cfset qFunRC = Application.List.FunRC>
					<select name="FunRCID" id="FunRCID">
						<cfloop query="qFunRC">
						<option value="#qFunRC.FunRCID#">#qFunRC.Name#</option>
						</cfloop>
					</select></td>
			</tr>
			<tr id="FunRCOther" style="display:none;">
				<td class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Primary role, other:</td>
				<td class="FieldInput"><input name="FunRCOther" type="text" value="#Attributes.FunRCOther#" maxlength="50" /></td>
			</tr>
			<tr class="NonClinical" style="display:none;">
				<td nowrap="nowrap" class="FieldLabel">7. Your Profession:</td>
				<td class="FieldInput">
					<cfset qProfN = Application.List.ProfN>
					<select name="ProfNID" id="ProfNID">
						<cfloop query="qProfN">
						<option value="#qProfN.ProfNID#">#qProfN.Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr id="ProfNOther" style="display:none;">
				<td class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Profession, other:</td>
				<td class="FieldInput"><input name="ProfNOther" type="text" value="#Attributes.ProfNOther#" maxlength="50" /></td>
			</tr>
			<tr class="NonClinical" style="display:none;">
				<td class="FieldLabel">8. Your primary functional role: </td>
				<td class="FieldInput">
				<cfset qFunRN = Application.List.FunRN>
					<select name="FunRNID" id="FunRNID">
						<cfloop query="qFunRN">
						<option value="#qFunRN.FunRNID#">#qFunRN.Name#</option>
						</cfloop>
					</select></td>
			</tr>
			<tr id="FunRNOther" style="display:none;">
				<td class="FieldLabel">Primary role, other:</td>
				<td class="FieldInput"><input name="FunRNOther" type="text" value="#Attributes.FunRNOther#" maxlength="50" /></td>
			</tr>
			<tr>
				<td nowrap="nowrap" class="FieldLabel">9. Location - State:</td>
				<td class="FieldInput">
				<cfset qStates = Application.List.States>
					<select name="WorkState" id="WorkState">
						<cfloop query="qStates">
						<option value="#qStates.Code#"<cfif Attributes.WorkState EQ qStates.Code> SELECTED</cfif>>#qStates.Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap" class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;Location - Zip Code:</td>
				<td class="FieldInput">
					<input name="WorkZip" type="text" id="WorkZip" style="width:70px;" value="#Attributes.WorkZip#" />
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">10. Principal Employment Setting:</td>
				<td class="FieldInput">
					<cfset qPrinEmp = Application.List.PrinEmp>
					<select name="PrinEmpID" id="PrinEmpID">
						<cfloop query="qPrinEmp">
                        <cfif qPrinEmp.PrinEmpId NEQ 15>
						<option value="#qPrinEmp.PrinEmpID#">#qPrinEmp.Name#</option>
                        </cfif>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr id="PrinEmpOther" style="display:none;">
				<td class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employment setting, other:</td>
				<td class="FieldInput"><input name="PrinEmpOther" type="text" value="#Attributes.PrinEmpOther#" maxlength="50" /></td>
			</tr>
			<tr>
				<td class="FieldLabel">11. Primary programmatic focus: <br />
					(select up to 2)</td>
				<td class="FieldInput">
					<table border="0" cellpadding="1" cellspacing="0">
						<tr>
							<td width="20"><input name="Focus1" type="checkbox" id="Focus1" class="FocusBox" value="Y"<cfif Attributes.Focus1 EQ "Y"> checked</cfif> /></td>
							<td width="180" nowrap="nowrap">STD</td>
							<td width="20"><input name="Focus2" type="checkbox" id="Focus2" class="FocusBox" value="Y"<cfif Attributes.Focus2 EQ "Y"> checked</cfif> /></td>
							<td width="225" nowrap="nowrap">HIV/AIDS</td>
							</tr>
						<tr>
							<td><input name="Focus3" type="checkbox" id="Focus3" class="FocusBox" value="Y"<cfif Attributes.Focus3 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Women's reproductive health </td>
							<td><input name="Focus4" type="checkbox" id="Focus4" class="FocusBox" value="Y"<cfif Attributes.Focus4 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">General medicine or Family practice </td>
							</tr>
						<tr>
							<td><input name="Focus5" type="checkbox" id="Focus5" class="FocusBox" value="Y"<cfif Attributes.Focus5 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Adolescent/student health </td>
							<td><input name="Focus6" type="checkbox" id="Focus6" class="FocusBox" value="Y"<cfif Attributes.Focus6 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Mental health </td>
							</tr>
						<tr>
							<td><input name="Focus7" type="checkbox" id="Focus7" class="FocusBox" value="Y"<cfif Attributes.Focus7 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Substance use/addiction </td>
							<td><input name="Focus8" type="checkbox" id="Focus8" class="FocusBox" value="Y"<cfif Attributes.Focus8 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Emergency medicine </td>
						</tr>
						<tr>
							<td><input name="Focus9" type="checkbox" id="Focus9" class="FocusBox" value="Y"<cfif Attributes.Focus9 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Corrections</td>
							<td><input name="Focus10" type="checkbox" id="Focus10" class="FocusBox" value="Y"<cfif Attributes.Focus10 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>Other</td>
										<td><input name="FocusOther" type="text" id="FocusOther" value="#Attributes.FocusOther#" maxlength="50" /></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</td>
			</tr>
			<tr>
				<td class="FieldLabel">12. Special population(s) or target group(s) focused on: <br />
					(select up to 3) </td>
				<td class="FieldInput">
					<table border="0" cellpadding="1" cellspacing="0">
						<tr>
							<td width="20"><input name="SpecialPop1" type="checkbox" id="SpecialPop1" class="PopBox" value="Y"<cfif Attributes.SpecialPop1 EQ "Y"> checked</cfif> /></td>
							<td width="180" nowrap="nowrap">No target group/general </td>
							<td width="20"><input name="SpecialPop2" type="checkbox" id="SpecialPop2" class="PopBox" value="Y"<cfif Attributes.SpecialPop2 EQ "Y"> checked</cfif> /></td>
							<td width="225" nowrap="nowrap">Adolescents</td>
							</tr>
						<tr>
							<td><input name="SpecialPop3" type="checkbox" id="SpecialPop3" class="PopBox" value="Y"<cfif Attributes.SpecialPop3 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Gay/Lesbian/Bisexual/MSM </td>
							<td><input name="SpecialPop4" type="checkbox" id="SpecialPop4" class="PopBox" value="Y"<cfif Attributes.SpecialPop4 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Transgender</td>
							</tr>
						<tr>
							<td><input name="SpecialPop5" type="checkbox" id="SpecialPop5" class="PopBox" value="Y"<cfif Attributes.SpecialPop5 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Homeless</td>
							<td><input name="SpecialPop6" type="checkbox" id="SpecialPop6" class="PopBox" value="Y"<cfif Attributes.SpecialPop6 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Incarcerated individuals/parolees </td>
							</tr>
						<tr>
							<td><input name="SpecialPop7" type="checkbox" id="SpecialPop7" class="PopBox" value="Y"<cfif Attributes.SpecialPop7 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Pregnant women</td>
							<td><input name="SpecialPop8" type="checkbox" id="SpecialPop8" class="PopBox" value="Y"<cfif Attributes.SpecialPop8 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Sex workers </td>
						</tr>
						<tr>
							<td><input name="SpecialPop9" type="checkbox" id="SpecialPop9" class="PopBox" value="Y"<cfif Attributes.SpecialPop9 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">African Americans </td>
							<td><input name="SpecialPop10" type="checkbox" id="SpecialPop10" class="PopBox" value="Y"<cfif Attributes.SpecialPop10 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Asians</td>
						</tr>
						<tr>
							<td><input name="SpecialPop11" type="checkbox" id="SpecialPop11" class="PopBox" value="Y"<cfif Attributes.SpecialPop11 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Native Hawaiian/Pacific Islanders </td>
							<td><input name="SpecialPop12" type="checkbox" id="SpecialPop12" class="PopBox" value="Y"<cfif Attributes.SpecialPop12 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">American Indian/Alaska Native </td>
						</tr>
						<tr>
							<td><input name="SpecialPop13" type="checkbox" id="SpecialPop13" class="PopBox" value="Y"<cfif Attributes.SpecialPop13 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Hispanic/Latinos</td>
							<td><input name="SpecialPop14" type="checkbox" id="SpecialPop14" class="PopBox" value="Y"<cfif Attributes.SpecialPop14 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Recent immigrants/refugees </td>
						</tr>
						<tr>
							<td><input name="SpecialPop15" type="checkbox" id="SpecialPop15" class="PopBox" value="Y"<cfif Attributes.SpecialPop15 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">Substance users</td>
							<td><input name="SpecialPop16" type="checkbox" id="SpecialPop16" class="PopBox" value="Y"<cfif Attributes.SpecialPop16 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">IDU</td>
						</tr>
						<tr>
							<td><input name="SpecialPop17" type="checkbox" id="SpecialPop17" class="PopBox" value="Y"<cfif Attributes.SpecialPop17 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap">HIV+ individuals </td>
							<td><input name="SpecialPop18" type="checkbox" id="SpecialPop18" class="PopBox" value="Y"<cfif Attributes.SpecialPop18 EQ "Y"> checked</cfif> /></td>
							<td nowrap="nowrap"><table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td style="padding-right:4px;">Other</td>
									<td><input name="SpecialPopOther" type="text" id="PopOther" value="#Attributes.SpecialPopOther#" maxlength="50" /></td>
								</tr>
							</table></td>
						</tr>
					</table>					</td>
			</tr>
			<tr>
				<td class="FieldLabel">13. How did you hear about this course?</td>
				<td class="FieldInput">
					<cfset qMarkets = Application.List.Market>
					<select name="MarketID" id="MarketID">
						<cfloop query="qMarkets">
						<option value="#qMarkets.MarketID#">#qMarkets.Name#</option>
						</cfloop>
					</select>
				</td>
			</tr>
			<tr id="MarketOther" style="display:none;">
				<td class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Specify, other:</td>
				<td class="FieldInput"><input name="MarketOther" type="text" value="#Attributes.MarketOther#" maxlength="50" /></td>
			</tr>
			
			
			
			
			
			
			
			
			<tr>
				<td nowrap="nowrap" class="FieldLabel">14. Contact - Receive Updates?</td>
				<td class="FieldInput">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><input name="ContactUpdates" type="radio" value="Y"<cfif Attributes.ContactUpdates EQ "Y"> checked</cfif> /></td>
							<td>Yes</td>
							<td><input name="ContactUpdates" type="radio" value="N"<cfif Attributes.ContactUpdates EQ "N"> checked</cfif> /></td>
							<td>No</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap" class="FieldLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Contact - Evaluation?:</td>
				<td class="FieldInput"><table width="98" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="20"><input name="ContactEval" type="radio" value="Y"<cfif Attributes.ContactEval EQ "Y"> checked</cfif> /></td>
						<td width="30">Yes</td>
						<td width="20"><input name="ContactEval" type="radio" value="N"<cfif Attributes.ContactEval EQ "N"> checked</cfif> /></td>
						<td width="130">No</td>
					</tr>
				</table></td>
			</tr>
			<tr>
				<td class="FieldLabel">15. Contact - PTC Alert?:</td>
				<td nowrap="nowrap" class="FieldInput">
					<table width="98" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="20"><input name="PTCAlert" type="radio" value="Y"<cfif Attributes.PTCAlert EQ "Y"> checked</cfif> /></td>
							<td width="30">Yes</td>
							<td width="20"><input name="PTCAlert" type="radio" value="N"<cfif Attributes.PTCAlert EQ "N"> checked</cfif> /></td>
							<td width="130">No</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">Currently enrolled in any type of training program for clinical licensure?</td>
				<td nowrap="nowrap" class="FieldInput">
					<table width="98" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="20"><input name="CurrentlyEnrolled" type="radio" value="1"<cfif Attributes.CurrentlyEnrolled EQ TRUE> checked</cfif> /></td>
							<td width="30">Yes</td>
							<td width="20"><input name="CurrentlyEnrolled" type="radio" value="0"<cfif Attributes.CurrentlyEnrolled EQ FALSE> checked</cfif> /></td>
							<td width="130">No</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">Is the PTC training relevant and does it contribute hours toward professional training program?</td>
				<td nowrap="nowrap" class="FieldInput">
					<table width="98" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="20"><input name="PTCtraining" type="radio" value="1"<cfif Attributes.PTCtraining EQ TRUE> checked</cfif> /></td>
							<td width="30">Yes</td>
							<td width="20"><input name="PTCtraining" type="radio" value="0"<cfif Attributes.PTCtraining EQ FALSE> checked</cfif> /></td>
							<td width="130">No</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="FieldLabel">Is your primary motivation to supplement your training rather than improve current practice?</td>
				<td nowrap="nowrap" class="FieldInput">
					<table width="98" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="20"><input name="PrimaryMotivation" type="radio" value="1"<cfif Attributes.PrimaryMotivation EQ TRUE> checked</cfif> /></td>
							<td width="30">Yes</td>
							<td width="20"><input name="PrimaryMotivation" type="radio" value="0"<cfif Attributes.PrimaryMotivation EQ FALSE> checked</cfif> /></td>
							<td width="130">No</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr style="display:none;">
				<td class="FieldLabel">Organization Type:</td>
				<td class="FieldInput">
					<cfset qOrgType = Application.List.OrgType>
					<select name="OrgTypeID" id="OrgTypeID">
						<cfloop query="qOrgType">
						<option value="#qOrgType.OrgTypeID#">#qOrgType.Name#</option>
						</cfloop>
					</select>				</td>
			</tr>
			<tr id="OrgTypeOther" style="display:none;">
				<td class="FieldLabel">Organization type, other:</td>
				<td class="FieldInput"><input name="OrgTypeOther" type="text" value="#Attributes.OrgTypeOther#" maxlength="50" /></td>
			</tr>
			<tr>
				<td class="FieldInput"></td>
			</tr>
		</table>
  	</form>
</div>
</cfoutput>
