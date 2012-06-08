<cfparam name="Attributes.Overview" default="" />
<cfparam name="Attributes.Keywords" default="" />
<cfparam name="Attributes.Objectives" default="" />
<cfparam name="Attributes.Goals" default="" />
<cfparam name="Attributes.PublishDate" default="" />
<cfparam name="Attributes.RemoveDate" default="" />
<cfparam name="Attributes.FeaturedFlag" default="N" />
<cfparam name="Attributes.extHostFlag" default="N" />
<cfparam name="Attributes.extHostLink" default="" />
<cfparam name="Attributes.PaymentFlag" default="N" />
<cfparam name="Attributes.PaymentFee" default="0.00" />
<cfparam name="Attributes.TermsFlag" default="N" />
<cfparam name="Attributes.AllowCommentFlag" default="N" />
<cfparam name="Attributes.CommentApproveFlag" default="N" />
<cfparam name="Attributes.NotifyEmails" default="" />
<cfparam name="Attributes.TermsText" default="" />
<cfparam name="Attributes.RestrictedFlag" default="N" />

<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveJS.cfm" />

<script>
tinyMCE.init({
	mode : "exact",
	elements : "Overview,Objectives,Keywords",
	theme : "simple",
	width:'450px',
	height:'150px',
	setup: function(ed) {
      ed.onKeyUp.add(function(ed, e) {
			Unsaved();
		  });
	   }
});
$(document).ready(function() {
	$("iframe").width('400');
	$('form').bind('form-pre-serialize', function(e) {
		tinyMCE.triggerSave();
	});

	$(".TermsBox").click(function() {
		if($(this).val() == 'Y') {
			$("#TermsContainer").show();
		} else {
			$("#TermsContainer").hide();
		}
	});
	
	$("#PaymentFlagY,#PaymentFlagN").click(function() {
		var sValue = $(this).val();
		
		if(sValue == 'Y') {
			$(".PaymentFeeArea").show();
		} else if (sValue == 'N') {
			$("#PaymentFee").val('0.00');
			$(".PaymentFeeArea").hide();
		}
	});
	
	$('.extHostFlag').change(function() {
		if($(this).val() == 'Y') {
			$('#ext-host-container').show();
		} else {
			$('#ext-host-container').hide();
		}
	});
});
</script>
<cfoutput>
<div class="ViewSection">
	<h3>General Publish Settings</h3>
	<form action="#Application.Settings.RootPath#/_com/AJAX_Activity.cfc" method="post" name="frmPubGeneral" id="EditForm">

    	<input type="hidden" name="method" value="savePubGeneral" />
    	<input type="hidden" name="ActivityID" value="#Attributes.ActivityID#" />
    	<input type="hidden" name="returnFormat" value="plain" />
		<cfinclude template="#Application.Settings.RootPath#/View/Includes/SaveInfo.cfm" />
		<table cellspacing="2" cellpadding="3" border="0">
			<tr>
				<td style="vertical-align:top;" valign="top"><label for="Overview">Overview</label></td>
				<td>
					<textarea name="Overview" id="Overview" >#Attributes.Overview#</textarea>
				</td>
			</tr>
			<tr>
				<td style="vertical-align:top;" valign="top"><label for="Objectives">Objectives</label></td>
				<td>
					<textarea name="Objectives" id="Objectives">#Attributes.Objectives#</textarea>
				</td>
			</tr>
			
			<tr>
				<td style="vertical-align:top;" valign="top"><label for="Keywords">Keywords</label></td>
				<td>
					<textarea name="Keywords" id="Keywords">#Attributes.Keywords#</textarea>
                </td>
            </tr>
			<tr>
				<td valign="top"><label for="PublishDate">Publish Date</label></td>
				<td><input type="text" name="PublishDate" id="PublishDate" class="DatePicker" value="#Attributes.PublishDate#" style="width:100px;" /> (date desired to be published)</td>
			</tr>
			<tr>
				<td class="" valign="top"><label for="RemoveDate">Remove Date</label></td>
				<td><input type="text" name="RemoveDate" id="RemoveDate" class="DatePicker" value="#Attributes.RemoveDate#" style="width:100px;" /> (date desired to be removed from sites)</td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="PaymentFlagY">Require Payment?</label></td>
				<td><input type="radio" name="PaymentFlag" id="PaymentFlagY" value="Y"<cfif Attributes.PaymentFlag EQ "Y"> checked</cfif> /><label for="PaymentFlagY"> Yes</label> <input type="radio" name="PaymentFlag" id="PaymentFlagN" value="N"<cfif Attributes.PaymentFlag EQ "N"> checked</cfif> /><label for="PaymentFlagN"> No</label></td>
			</tr>
			<tr class="PaymentFeeArea"<cfif Attributes.PaymentFlag EQ "N"> style="display:none;"</cfif>>
				<td valign="top" nowrap="nowrap"><label for="PaymentFlagY">Fee Amount</label></td>
				<td><input type="text" name="PaymentFee" id="PaymentFee" style="width:70px;" value="#Attributes.PaymentFee#" /> (ex: 30.00)</td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="PaymentFlagY">Restrict to Registrants List?</label></td>
				<td><input type="radio" name="RestrictedFlag" id="RestrictedFlagY" value="Y"<cfif Attributes.RestrictedFlag EQ "Y"> checked</cfif> /><label for="RestrictedFlagY"> Yes</label> <input type="radio" name="RestrictedFlag" id="RestrictedFlagN" value="N"<cfif Attributes.RestrictedFlag EQ "N"> checked</cfif> /><label for="RestrictedFlagN"> No</label></td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="TermsFlag">Require Terms?</label></td>
				<td><input type="radio" name="TermsFlag" id="TermsFlagY" class="TermsBox" value="Y"<cfif Attributes.TermsFlag EQ "Y"> checked</cfif> /><label for="TermsFlagY"> Yes</label> <input type="radio" name="TermsFlag" id="TermsFlagN" class="TermsBox" value="N"<cfif Attributes.TermsFlag EQ "N"> checked</cfif> /><label for="TermsFlagN"> No</label></td>
			</tr>
			<tr id="TermsContainer"<cfif Attributes.TermsFlag EQ "N"> style="display:none;"</cfif>>
				<td valign="top"><label for="TermsText">Terms Text</label></td>
				<td>
					<textarea name="TermsText" id="TermsText" style="width:425px;">#Attributes.TermsText#</textarea>
				</td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="FeaturedFlag">Featured Activity?</label></td>
				<td><input type="radio" name="FeaturedFlag" id="FeaturedFlagY" class="CommentsBox" value="Y"<cfif Attributes.FeaturedFlag EQ "Y"> checked</cfif> /><label for="FeaturedFlagY"> Yes</label> <input type="radio" name="FeaturedFlag" id="FeaturedFlagN" class="CommentsBox" value="N"<cfif Attributes.FeaturedFlag EQ "N"> checked</cfif> /><label for="FeaturedFlagN"> No</label></td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="extHostFlag">Externally Hosted Activity?</label></td>
				<td><input type="radio" name="extHostFlag" class="extHostFlag" id="extHostFlagY" value="Y"<cfif Attributes.extHostFlag EQ "Y"> checked</cfif> /><label for="extHostFlagY"> Yes</label> <input type="radio" name="extHostFlag" class="extHostFlag" id="extHostFlagN" value="N"<cfif Attributes.extHostFlag EQ "N"> checked</cfif> /><label for="extHostFlagN"> No</label> <span id="ext-host-container"<cfif Attributes.extHostFlag EQ "N"> style="display:none;"</cfif>><input type="text" name="extHostLink" id="extHostLink" value="#attributes.extHostLink#" placeholder="External Activity Address" style="width: 225px;" /></span></td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="AllowCommentFlag">Allow Comments</label></td>
				<td><input type="radio" name="AllowCommentFlag" id="AllowCommentFlagY" class="CommentsBox" value="Y"<cfif Attributes.AllowCommentFlag EQ "Y"> checked</cfif> /><label for="AllowCommentFlagY"> Yes</label> <input type="radio" name="AllowCommentFlag" id="AllowCommentFlagN" class="CommentsBox" value="N"<cfif Attributes.AllowCommentFlag EQ "N"> checked</cfif> /><label for="AllowCommentFlagN"> No</label></td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="CommentApproveFlag">Require Comment Approval</label></td>
				<td><input type="radio" name="CommentApproveFlag" id="CommentApproveFlagY" class="CommentApprovalBox" value="Y"<cfif Attributes.CommentApproveFlag EQ "Y"> checked</cfif> /><label for="CommentApprovalFlagY"> Yes</label> <input type="radio" name="CommentApproveFlag" id="CommentApproveFlagN" class="CommentApprovalBox" value="N"<cfif Attributes.CommentApproveFlag EQ "N"> checked</cfif> /><label for="CommentApproveFlagN"> No</label></td>
			</tr>
			<tr>
				<td valign="top" nowrap="nowrap"><label for="NotifyEmails">Notify Email Addresses</label></td>
				<td><input type="text" name="NotifyEmails" id="NotifyEmailsN" class="EmailBox" value="#Attributes.NotifyEmails#" /></td>
			</tr>
		</table>
	</form>
</div>
</cfoutput>