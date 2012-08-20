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
			console.log(data);
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
#errorMessagesFor("person")#

#startFormTag(controller="ajax_lms_auth",action="register", id="frmRegister",class="form register responsiveForm span12")#
<div class="grouped">
	#btextField(
		objectName='person', 
		property='firstName', 
		append="<p class='help-block'></p>", 
		prepend="",
		label="Full Name",
		autocomplete="off"
	)#

	#btextField(
		objectName='person', 
		property='suffix', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Suffix",
		autocomplete="off"
	)#

	#btextField(
		objectName='person', 
		property='geonameid', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="City / Town",
		autocomplete="off"
	)#

	#btextField(
		objectName='person', 
		property='email', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Email Address",
		autocomplete="off"
	)#

	#btextField(
		objectName='person', 
		property='emailConfirm', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Confirm Address*",
		autocomplete="off"
	)#

	#bpasswordField(
		objectName='person', 
		property='password', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Password",
		autocomplete="off"
	)#

	#bpasswordField(
		objectName='person', 
		property='passwordConfirmation', 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Retype Password",
		autocomplete="off"
	)#
	
	#bselect(
		objectName="person", 
		property="gender", 
		append="<p class='help-block'></p>", 
		prepend="", 
		label="Gender", 
		options={"F":"Female","M":"Male"}, 
		includeBlank=true
	)#

	<p>Display Name* (used on certificates and transcripts)</p>
	<div class="displayname-container">
		#btextField(objectName='person', property='displayName', append="", prepend="", label="", class="span5")#
	</div>
	#submitTag(id="btnRegister")#
</div>
#endFormTag()#
</cfoutput>