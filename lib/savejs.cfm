<cfparam name="Attributes.ThisUpdated" default="">

<script>
var IsSaved = true;
var isPublishArea = false; // USED TO DETERMINE IF PUBLISH BAR IS UPDATED
var ChangedFields = "";
var ChangedValues = "";

function FCKeditor_OnComplete( editorInstance ) {

	if (document.all) {      
	// IE
		editorInstance.EditorDocument.attachEvent("onkeyup", Unsaved) ;
	} else {
	   // other browser
	   editorInstance.EditorDocument.addEventListener( 'keyup', Unsaved, true ) ;
	} 
	
	  
}

function Unsaved() {
	if(IsSaved) {
		$("#btnSave").attr('disabled',false).val("Save Now");
		$("#btnDiscard").show();
		//AutoSave();
	}
	IsSaved = false;
}

function AddChange(sField,sValue) {
	if(sValue == '') {
		sValue = '%20';
	}
		if(!$.ListFind(ChangedFields,sField,'|')) {
			ChangedFields = $.ListAppend(ChangedFields,sField,'|');
			ChangedValues = $.ListAppend(ChangedValues,sValue,'|');
			
		} else {
			nLocation = $.ListFind(ChangedFields,sField,'|');
			ChangedValues = $.ListSetAt(ChangedValues,nLocation,sValue,'|');
		}
		
		$("#ChangedFields").val(ChangedFields);
		$("#ChangedValues").val(ChangedValues);
		// console.log(ChangedFields + ' ' + ChangedValues);
}

function ClearChanges() {
	ChangedFields = "";
	ChangedValues = "";
	$("#ChangedFields").val("");
	$("#ChangedValues").val("");
}

/*function AutoSave() {
	$("#SaveInfo").oneTime("60s",function() {
		 var d = new Date();
		if(!IsSaved) {
			$(this).ajaxSubmit({
				beforeSubmit: function(){
					$("#btnSave").val("Saving...").attr('disabled',true);
				},
				success:function(responseText,statusText) {
					var d = new Date();
					
					if($.Trim(responseText) != 'success') {
						addError(responseText,250,6000,4000);
						$("#btnSave").val("Save Now").attr('disabled',false);
						IsSaved = false;
					} else {
						$("#btnSave").val("Saved").attr('disabled',true);
						$(this).text("Auto-saved at " + d.getHours() + ":" + d.getMinutes());
						IsSaved = true;
					}
				}
			}); 
			
		}
	});
}*/

$(document).ready(function() {
	<cfif Attributes.ThisUpdated NEQ "">
	IsSaved = true;
	$("#btnSave").val("Saved").attr('disabled',true);
	$("#SaveInfo").text("Last saved <cfoutput><cfif DateDiff("d",Attributes.ThisUpdated,now()) GT 0>on #DateFormat(Attributes.ThisUpdated,'mm/dd/yyyy')#</cfif> at #TimeFormat(Attributes.ThisUpdated,'h:mm TT')#</cfoutput>");
	</cfif>
	$("input,textarea").keyup(function() {
		Unsaved();
		AddChange($("label[for='" + this.id + "']").html(),$(this).attr('value'));
	});
	$("select").live("change",function() {
		if(this.id != "AuthLevel" && this.id != "StatusChanger" && this.id != "CatAdder") {
			Unsaved();
			AddChange($(this).attr('name'),$(this).children('option[value=' + $(this).val() + ']').text());
		}
	});
	$("input[type='checkbox']").live("change",function() {
		Unsaved();
		AddChange($(this).attr('name'),$(this).attr('id'));
	});
	$("input[type='radio']").live("click",function() {
		Unsaved();
		AddChange($(this).attr('name'),$("label[for='" + this.id + "']").html());
	});
	
	$("#btnDiscard").click(function() {
		$("#btnSave").attr('disabled',true).val("Saved");
		IsSaved = true;
		ClearChanges();
		$(this).hide();
	});
	
	$('#EditForm').submit(function() { 
        $(this).ajaxSubmit({
			type:'post',
			dataType:'json',
			beforeSubmit: function(){
				$("#btnSave").val("Saving...").attr('disabled',true);
			},
			success:function(responseText,statusText) {
				var d = new Date();
				
				if(responseText.STATUS == "false") {
					$.each(responseText.ERRORS, function(i,item){
						addError(item.MESSAGE,250,6000,4000);
					});
					
					$("#btnSave").val("Save Now").attr('disabled',false);
					IsSaved = false;
				} else {					
					$("#btnSave").val("Saved").attr('disabled',true);
					$("#btnDiscard").hide();
					$("#SaveInfo").text("Last saved at " + d.getHours() + ":" + d.getMinutes() + " <cfoutput>#TimeFormat(now(),'TT')#</cfoutput>");
					if(isPublishArea) {
						updatePublishState();
					}
					updateAll();
					ClearChanges();
					IsSaved = true;
				}
			}
		}); 
		
        return false; 
    });
	
	
	var question232 = $("#question232");
	var TheLink = '';
	$(".PageStandard").hide();
	
	$(".TabControl a,#HeaderNav a,#HeaderSubNav a,#Breadcrumbs a,a.LeaveLink").bind("click", this, function(){
			TheLink = this.href;
			
			if (!IsSaved) {
				$.extend($.blockUI.defaults.overlayCSS, { backgroundColor: '#000' });
				$.blockUI({message: question232, width: '275px' });
				
				return false;
			}
		});
	
	$('#yes').click(function() { 
		$.unblockUI();
		window.location=TheLink;
	}); 
	
	$('#no').click($.unblockUI);
	
	$('a.button').unbind("click");
	/*END UNSAVED CHANGES CRAP */
});
</script>