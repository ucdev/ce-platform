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
		url: "/AJAX_lms_Auth/validate",
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
		success: function(data) {
			if(data.STATUS) {
				$("#frmRegister").submit();
			} else {
				var sErrorList = "<ul>";
				
				// REMOVE ERROR CLASS
				$("label").removeClass("FieldInputErr");
				
				$.each(data.ERRORS, function(i,item){
					sErrorList = sErrorList + "<li>" + item.MESSAGE + "</li>";
					
					// TEST IF THE ERROR IS TIED TO TWO FIELDS
					if(!($.Find(":", item.FIELDNAME))) {
						$("#" + item.FIELDNAME + "-label").addClass("FieldInputErr");
					} else {
						$("#" + $.ListGetAt(item.FIELDNAME, 1, ":") + "-label").addClass("FieldInputErr");
						$("#" + $.ListGetAt(item.FIELDNAME, 2, ":") + "-label").addClass("FieldInputErr");
					}
				});
				
				sErrorList = sErrorList + "</ul>";
				$(".error_list").html(sErrorList);
				
				return false;
			}
		}
	});
}

$(document).ready(function() {
	updateDisplayName();
	
	$("#frmRegister").click(function() {
		validate();
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
#startFormTag(action="register", id="frmRegister")#
#textField(objectName='person', property='firstName', append="", prepend="", label="First Name*", class="span5", placeholder="First Name")#
#textField(objectName='person', property='middleName', append="", prepend="", label="Middle Name", class="span5", placeholder="Middle Name")#
#textField(objectName='person', property='lastName', append="", prepend="", label="Last Name*", class="span5", placeholder="Last Name")#
#textField(objectName='person', property='suffix', append="", prepend="", label="Suffix", class="span5", placeholder="Suffix")#
#textField(objectName='person', property='geonameid', append="", prepend="", label="City / Town*", class="span5")#
#textField(objectName='person', property='email', append="", prepend="", label="Email Address*", class="span5", placeholder="Email Address")#
#textField(objectName='person', property='emailConfirm', append="", prepend="", label="Confirm Address*", class="span5", placeholder="Retype Email")#
#passwordField(objectName='person', property='password', append="", prepend="", label="Password", class="span5", placeholder="Password")#
#passwordField(objectName='person', property='passwordConfirmation', append="", prepend="", label="Retype Password", class="span5", placeholder="Retype Password")#
#select(objectName="person", property="gender", append="", prepend="", class="span5", label="Gender", options={"F":"Female","M":"Male"}, includeBlank=true)#

<p>Display Name* (used on certificates and transcripts)</p>
<div class="displayname-container">
	#textField(objectName='person', property='displayName', append="", prepend="", label="", class="span5", placeholder="Display Name")#
</div>
#submitTag()#
#endFormTag()#
</cfoutput>


