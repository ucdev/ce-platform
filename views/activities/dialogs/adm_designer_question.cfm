<cfimport prefix="question" taglib="/admin/_tags/QuestionTypes">
<cfparam name="Attributes.QuestionID" default="0" />
<cfparam name="Attributes.QuestionMode" default="Add" />
<cfparam name="Attributes.QuestionTypeID" default="1" />
<cfparam name="Attributes.LabelText" default="" />
<cfparam name="Attributes.DetailText" default="" />
<cfparam name="Attributes.VC1" default="" />
<cfparam name="Attributes.VC2" default="" />
<cfparam name="Attributes.VC3" default="" />
<cfparam name="Attributes.VC4" default="" />
<cfparam name="Attributes.VC5" default="" />
<cfparam name="Attributes.VC6" default="" />
<cfparam name="Attributes.VC7" default="" />
<cfparam name="Attributes.VC8" default="" />
<cfparam name="Attributes.VC9" default="" />
<cfparam name="Attributes.VC10" default="" />
<cfparam name="Attributes.RequiredFlag" default="N" />
<cfparam name="Attributes.CorrectField" default="VC1" />
<cfoutput>
<link href="#Application.Settings.RootPath#/_styles/Assessment.css" rel="stylesheet" type="text/css" />

<!--- Query Question Types --->
<cfset qTypes = Application.Com.QuestionTypeGateway.getByAttributes(DeletedFlag='N',OrderBy="Name")>

<!--- Determine if More Options --->
<cfif Attributes.VC6 NEQ "" OR Attributes.VC7 NEQ "" OR Attributes.VC8 NEQ "" OR Attributes.VC9 NEQ "" OR Attributes.VC10 NEQ "">
	<cfset ShowMoreOptions = true>
<cfelse>
	<cfset ShowMoreOptions = false>
</cfif>
<cfset Request.QuestionNo = 1>
<script>
$(document).ready(function() {
	<!--- CHECK IF DETAILSTEXT IS BLANK --->
	<cfif Attributes.DetailText NEQ "">
		$("##AddDetailsLink").hide();
		$(".Details").slideDown();
	</cfif>
	
	$("##AddDetailsLink").click(function() {
		$("##AddDetailsLink").hide();
		$(".Details").slideDown();
	});
	
	$("##AddOptionsLink").click(function() {
		$("##AddOptionsLink").hide();
		$(".MoreOptions").slideDown();
	});
	
	$("##QuestionType").change(function() {
		setType(this.value);
	});
	
	<cfif Attributes.QuestionTypeID NEQ "">
	setType(#Attributes.QuestionTypeID#);
	</cfif>
	
	<cfif Attributes.CorrectField NEQ "">
	$("##Correct#Attributes.CorrectField#").attr('checked',true);
	</cfif>
	
	$("input[name='insertFlag']").change(function() {
		if($(this).val() == 'Y') {
			$(".ManualSort").css("display","block");
		} else {
			$(".ManualSort").css("display","none");
		}
	});
});

function setType(nTypeID) {
	$("##QuestionType").val(nTypeID);
	var nType = parseInt(nTypeID);
	switch(nType)
	{
		/* Multiple Choice (Single Answer) */
		case 1: 
			$(".RequireAnswer").slideDown();
			$(".MainOptions").slideDown();
			$("##LabelTextField").html("Question");
			<cfif qDetails.AssessTypeID EQ 2 OR qDetails.AssessTypeID EQ 3>
			$(".CorrectAnswer").show();
			<cfelse>
			$(".CorrectAnswer").hide();
			</cfif>
			<cfif ShowMoreOptions>
			$("##AddOptionsLink").hide();
			$(".MoreOptions").slideDown();
			<cfelse>
			$("##AddOptionsLink").show();
			$(".MoreOptions").slideUp();
			</cfif>
		break;  
		
		/* Rating (1-5,Like/Dislike) */  
		case 2:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Text (Single Line) */  
		case 3:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Text (Multi Line) */  
		case 4:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Caption 1 */  
		case 5:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideUp();
			$("##LabelTextField").html("Caption");
		break;
		
		/* Caption 2 */  
		case 6:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideUp();
			$("##LabelTextField").html("Caption");
		break;
		
		/* Caption 3 */  
		case 7:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideUp();
			$("##LabelTextField").html("Caption");
		break;
		
		/* Multiple Choice (Multi Answer) */  
		case 8:
			$(".MainOptions").slideDown();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
			<cfif ShowMoreOptions>
			$("##AddOptionsLink").hide();
			$(".MoreOptions").slideDown();
			<cfelse>
			$("##AddOptionsLink").show();
			$(".MoreOptions").slideUp();
			</cfif>
		break;
		
		/* Rating (1-5,Agree/Disagree) */  
		case 9:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Date Entry */  
		case 12:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Date Range Entry */  
		case 13:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		
		/* Date Year Only */  
		case 14:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideDown();
			$("##LabelTextField").html("Question");
		break;
		

		default:
			$(".MainOptions").slideUp();
			$(".MoreOptions").slideUp();
			$(".RequireAnswer").slideUp();
			$("##LabelTextField").html("Question");
	}
}
</script>
<h3>#qDetails.Name# Question</h3>
<form action="#Application.Settings.RootPath#/_com/AJAX_Builder.cfc" method="post" id="frmComp" name="frmComp">
 <input type="hidden" name="method" value="SaveQuestion" />
 <input type="hidden" name="AssessmentID" value="#Attributes.AssessmentID#" />
 <input type="hidden" name="QuestionID" value="<Cfif Attributes.QuestionMode EQ "Add">0<cfelse>#Attributes.QuestionID#</cfif>" />
 <input type="hidden" name="returnformat" value="plain" />
<table width="100%" cellspacing="1" border="0" cellpadding="2">
	<tr>
		<td class="FieldLabel2" style="width:150px;">Type</td>
		<td class="FieldInput2">
			<select name="QuestionTypeID" id="QuestionType">
				<cfloop query="qTypes">
				<option value="#qTypes.QuestionTypeID#">#qTypes.Name#</option>
				</cfloop>
			</select>
		</td>
	</tr>	
	<tr>
		<td class="FieldLabel2" colspan="2" id="LabelTextField">Label</td>
	</tr>
	<tr>
		<td class="FieldInput2" colspan="2">
			<textarea name="LabelText" id="LabelText" style="width:450px;height:50px;">#Attributes.LabelText#</textarea>
			<div><a link="javascript:void(0);" id="AddDetailsLink" style="cursor:pointer;">Add additional details...</a></div>
		</td>
	</tr>
</table>
<table width="100%" cellspacing="1" border="0" cellpadding="2" class="FormFields">
	<tr class="Details" style="display:none;">
		<td class="FieldLabel2" colspan="2">Details</td>
	</tr>
	<tr class="Details" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<textarea name="DetailText" id="DetailText" style="width:450px;height:100px;">#Attributes.DetailText#</textarea>
		</td>
	</tr>
</table>
<table width="100%" cellspacing="1" border="0" cellpadding="2">
	<tr style="display: block;">
		<td class="FieldLabel2" style="width:150px;">Manually Sort?</td>
		<td class="FieldInput2">
			<input type="radio" name="insertFlag" id="insertY" Value="Y" /> Yes <input type="radio" name="insertFlag" id="insertN" Value="N" CHECKED /> No
		</td>
	</tr>
	<tr class="ManualSort" style="display:none;">
		<td class="FieldLabel2" style="width:150px;">Question ##</td>
		<td class="FieldInput2">
			<input type="text" name="Sort" id="Sort" Value="" />
		</td>
	</tr>
	<tr class="RequireAnswer" style="display:none;">
		<td class="FieldLabel2" style="width:150px;">Require Answer?</td>
		<td class="FieldInput2">
			<input type="radio" name="RequiredFlag" id="RequiredYes" Value="Y"<cfif Attributes.RequiredFlag EQ "Y"> CHECKED</cfif> /> Yes <input type="radio" name="RequiredFlag" id="RequiredNo" Value="N"<cfif Attributes.RequiredFlag EQ "N"> CHECKED</cfif> /> No
		</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option A</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC1" value="VC1" /><label for="CorrectVC1">Mark As Correct</label></div>
			<textarea name="VC1" id="VC1" style="width:450px;height:50px;">#Attributes.VC1#</textarea>
		</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option B</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC2" value="VC2" /><label for="CorrectVC2">Mark As Correct</label></div>
			<textarea name="VC2" id="VC2" style="width:450px;height:50px;">#Attributes.VC2#</textarea>
		</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option C</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC3" value="VC3" /><label for="CorrectVC3">Mark As Correct</label></div>
			<textarea name="VC3" id="VC3" style="width:450px;height:50px;">#Attributes.VC3#</textarea>
		</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option D</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC4" value="VC4" /><label for="CorrectVC4">Mark As Correct</label></div>
			<textarea name="VC4" id="VC4" style="width:450px;height:50px;">#Attributes.VC4#</textarea>
		</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option E</td>
	</tr>
	<tr class="MainOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC5" value="VC5" /><label for="CorrectVC5">Mark As Correct</label></div>
			<textarea name="VC5" id="VC5" style="width:450px;height:50px;">#Attributes.VC5#</textarea>
			<div><a link="javascript:void(0);" id="AddOptionsLink" style="cursor:pointer;">Add additional options...</a></div>
		</td>
	</tr>
</table>
<table width="100%" cellspacing="1" border="0" cellpadding="2" class="FormFields">
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option F</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC6" value="VC6" /><label for="CorrectVC6">Mark As Correct</label></div>
			<textarea name="VC6" id="VC6" style="width:450px;height:50px;">#Attributes.VC6#</textarea>
		</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option G</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC7" value="VC7" /><label for="CorrectVC7">Mark As Correct</label></div>
			<textarea name="VC7" id="VC7" style="width:450px;height:50px;">#Attributes.VC7#</textarea>
		</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option H</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC8" value="VC8" /><label for="CorrectVC8">Mark As Correct</label></div>
			<textarea name="VC8" id="VC8" style="width:450px;height:50px;">#Attributes.VC8#</textarea>
		</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option I</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC9" value="VC9" /><label for="CorrectVC9">Mark As Correct</label></div>
			<textarea name="VC9" id="VC9" style="width:450px;height:50px;">#Attributes.VC9#</textarea>
		</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldLabel2" colspan="2">Option J</td>
	</tr>
	<tr class="MoreOptions" style="display:none;">
		<td class="FieldInput2" colspan="2">
			<div class="CorrectAnswer" style="display:none;"><input type="radio" name="CorrectField" id="CorrectVC10" value="VC10" /><label for="CorrectVC10">Mark As Correct</label></div>
			<textarea name="VC10" id="VC10" style="width:450px;height:50px;">#Attributes.VC10#</textarea>
		</td>
	</tr>
</table>
</form>
</cfoutput>