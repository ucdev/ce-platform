<cfset FieldList = "Received|Received,Sent|Sent,Approved|Approved,Needs Assessment|Needs,Objectives|Obj,Support|Supp,Attendance|Attend,CV|CV,Brochure|Broch,Member Approval|MembAppr,Conflict|Conflict,Evaluation|Eval">
<cfoutput>
<cfloop list="#FieldList#" index="i" delimiters=",">
	<cfset FieldLabel = GetToken(i,1,"|")>
	<cfset FieldNamePrefix = GetToken(i,2,"|")>
	
	<cfparam name="#FieldNamePrefix & 'Flag'#" default="N" />
	<cfparam name="#FieldNamePrefix & 'Date'#" default="" />
</cfloop>
</cfoutput>
<script>
	$(document).ready(function() {
		$("input").unbind("keyup");
		$(".AppDate").keyup(function() {
			var sField = $.Replace($(this).attr('name'),'Date','');
			var dtDateVal = new Date();
			var sFlagVal = 'Y';
			if($.IsDate($(this).val())) {
				dtDateVal = $(this).val();
				$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "updateApplicationValue", ActivityID: nActivity, Field: sField, Flag: 'Y', AppDate: dtDateVal, ReturnFormat:"plain" },
					function(returnData) {
						cleanData = $.trim(returnData);
						status = $.ListGetAt(cleanData,1,"|");
						statusMsg = $.ListGetAt(cleanData,2,"|");
						if(status == 'Failed') {
							addError(statusMsg,250,6000,4000);
						} else {
							if(sFlagVal == 'Y') {
								$("input[name='" + sField + "Date']").attr("disabled",false).val(dtDateVal);
							} else {
								$("input[name='" + sField + "Date']").attr("disabled",true).val('');
							}
							addMessage(statusMsg,250,6000,4000);
						}
				});
			}
		});
		
		$(".AppCheck").click(function() {
			var sFlagVal = 'N';
			var dtDateVal = new Date();
			var sField = $(this).attr('id');
			dtDateVal = $.DateFormat(dtDateVal,'mm/dd/yyyy');
			
			if($(this).attr("checked") == 'checked') {
				sFlagVal = 'Y';
			} else {
				dtDateVal = '';
			}
			
			$.post(sRootPath + "/_com/AJAX_Activity.cfc", { method: "updateApplicationValue", ActivityID: nActivity, Field: sField, Flag: sFlagVal, AppDate: dtDateVal, ReturnFormat:"plain" },
				function(returnData) {
					cleanData = $.trim(returnData);
					status = $.ListGetAt(cleanData,1,"|");
					statusMsg = $.ListGetAt(cleanData,2,"|");
					
					if(status == 'Failed') {
						addError(statusMsg,250,6000,4000);
					} else {
						if(sFlagVal == 'Y') {
							$('#' + sField + 'Text').attr("disabled",false).val(dtDateVal);
						} else {
							$('#' + sField + 'Text').attr("disabled",true).val('');
						}
						addMessage(statusMsg,250,6000,4000);
					}
			});
		});
	});
</script>
<cfoutput>
<div class="ViewSection">
<h3>Application</h3>
	<form action="#myself#Activity.Application?ActivityID=#Attributes.ActivityID#&Submitted=1" method="post" name="frmEditActivity">
    <table cellspacing="2" cellpadding="3" border="0">
		<cfset FieldID = 0>
		<cfloop list="#FieldList#" index="i" delimiters=",">
			<cfset FieldLabel = GetToken(i,1,"|")>
			<cfset FieldNamePrefix = GetToken(i,2,"|")>
			<cfset FieldID++>
        <tr>
            <td class="FieldLabel">#FieldLabel#</td>
            <td class="FieldInput"><input type="checkbox" name="#FieldNamePrefix#Flag" id="#FieldNamePrefix#" class="AppCheck" value="Y"<cfif Evaluate("ActivityApp.get#FieldNamePrefix#Flag()") EQ "Y"> checked</cfif> /></td>
			<td class="FieldInput"><input type="text" name="#FieldNamePrefix#Date" id="#FieldNamePrefix#Text" class="AppDate" value="#DateFormat(Evaluate('ActivityApp.get#FieldNamePrefix#Date()'),'mm/dd/yyyy')#" style="width:95px;"<cfif Evaluate("ActivityApp.get#FieldNamePrefix#Flag()") NEQ "Y"> disabled="disabled"</cfif> /></td>
        </tr>
		</cfloop>
	</table>
	</form>
</div>
</cfoutput>