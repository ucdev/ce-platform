<script>
function updateDisplayName() {
	var firstName = $("#person-firstName").val();
	var middleName = $("#person-middleName").val();
	var lastName = $("#person-lastName").val();
	var suffix = $("#person-suffix").val();
	
	if(middleName.length > 0 && suffix.length > 0) {
		$('#person-displayName').val(firstName + ' ' + middleName + ' ' + lastName + ', ' + suffix);
	} else if(middleName.length > 0 && suffix.length == 0) {
		$('#person-displayName').val(firstName + ' ' + middleName + ' ' + lastName);
	} else if(middleName.length == 0 && suffix.length > 0) {
		$('#person-displayName').val(firstName + ' ' + lastName + ', ' + suffix);
	} else {
		$('#person-displayName').val(firstName + ' ' + lastName);
	}
}

function validate() {
	$.ajax({
		url: "/ajax_lms_auth/validate",
		type: 'post',
		data: { 
			FirstName: $("#person-firstName").val(), 
			MiddleName: $("#person-middleName").val(), 
			LastName: $("#person-lastName").val(), 
			Suffix: $("#person-suffix").val(), 
			DisplayName: $('#person-displayName').val(), 
			Email1: $("#person-email").val(), 
			Email2: $("#person-emailConfirm").val(), 
			Gender: $("#person-gender").val(), 
			Password1: $("#person-password").val(), 
			Password2: $("#person-passwordConfirmation").val(), 
			geonameId: $("#person-geonameid").val(), 
			returnFormat: "plain"},
		dataType: 'json',
		beforeSend: function() {
			// REMOVE ERROR CLASSES
			$('label').removeClass("control-group error");
			
			// REMOVE ERROR MESSAGES
			$('p.help-block').html('');
		},
		success: function(data) {
			if(data.STATUS) {
				// SUBMIT FORM
				$("#frmRegister").submit();
			} else {
				// ADD ERROR MESSAGES
				$.each(data.ERRORS, function(i,item){
					$.each(item.FIELDNAME.split(':'), function(i, fieldName) {
						$("label[for='person-" + fieldName + "']").addClass("control-group error");
						$("label[for='person-" + fieldName + "']").children('p.help-block').html(item.MESSAGE);
					});
				});
				
				// PROVIDE FIELD FOCUS
				$('label.error').first().focus();
				
				return false;
			}
		}
	});
}

$(document).ready(function() {
	updateDisplayName();
	
	$("#btnRegister").click(function(e) {
		validate();
		
		e.preventDefault();
	});
	
	$("#person-firstName, #person-middleName, #person-lastName, #person-suffix").keyup(function() {
		updateDisplayName();
	});
	
	$('input,select').keyup(function(e)  {
		if(e.keyCode == 13) {
			validate();
		}
	});
	
	$("#person-geonameid").tokenInput("http://ws.geonames.org/searchJSON?featureClass=P&style=full&maxRows=12",{
		queryParam:'name_startsWith',
		tokenLimit:1,
		tokenValue:'geonameId',
		jsonContainer:'geonames',
		resultsFormatter:function(item) {
			return "<li>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</li>"
		},
		tokenFormatter:function(item) {
			return "<li><p>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</p></li>"
		}
	});
	
	$.ajax({
		url:'http://freegeoip.net/json/',
		dataType:'jsonp',
		crossDomain:true,
		success:function(data) {
			$.ajax({
				url:'http://ws.geonames.org/searchJSON',
				type:'get',
				data:{
					featureClass:'P',
					style:'full',
					maxRows:12,
					q:data.region_name + ' ' + data.zipcode + ' ' + data.country_name
				},
				dataType:'json',
				success:function(data) {
					$("#person-geonameid").tokenInput('add',data.geonames[0]);
				}
			});
		}
	});
});
</script>
<cfoutput>
<h2>Sign up</h2>
#errorMessagesFor("person")#
#startFormTag(controller="ajax_lms_auth",action="register", id="frmRegister")#
#textField(objectName='person', property='firstName', append="<p class='help-block'></p>", prepend="", label="First Name*", class="span5", placeholder="First Name")#
#textField(objectName='person', property='middleName', append="<p class='help-block'></p>", prepend="", label="Middle Name", class="span5", placeholder="Middle Name")#
#textField(objectName='person', property='lastName', append="<p class='help-block'></p>", prepend="", label="Last Name*", class="span5", placeholder="Last Name")#
#textField(objectName='person', property='suffix', append="<p class='help-block'></p>", prepend="", label="Suffix", class="span5", placeholder="Suffix")#
#textField(objectName='person', property='geonameid', append="<p class='help-block'></p>", prepend="", label="City / Town*", class="span5")#
#textField(objectName='person', property='email', append="<p class='help-block'></p>", prepend="", label="Email Address*", class="span5", placeholder="Email Address")#
#textField(objectName='person', property='emailConfirm', append="<p class='help-block'></p>", prepend="", label="Confirm Address*", class="span5", placeholder="Retype Email")#
#passwordField(objectName='person', property='password', append="<p class='help-block'></p>", prepend="", label="Password", class="span5", placeholder="Password")#
#passwordField(objectName='person', property='passwordConfirmation', append="<p class='help-block'></p>", prepend="", label="Retype Password", class="span5", placeholder="Retype Password")#
#select(objectName="person", property="gender", append="<p class='help-block'></p>", prepend="", class="span5", label="Gender", options={"F":"Female","M":"Male"}, includeBlank=true)#

<p>Display Name* (used on certificates and transcripts)</p>
<div class="displayname-container">
	#textField(objectName='person', property='displayName', append="", prepend="", label="", class="span5", placeholder="Display Name")#
</div>
#submitTag(id="btnRegister")#
#endFormTag()#
</cfoutput>


