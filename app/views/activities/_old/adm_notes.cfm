<cfparam name="Attributes.NoteBody" default="">

<script>
<cfoutput>
nActivity = #Attributes.ActivityID#;
</cfoutput>
$(document).ready(function() {
	$("a.DeleteNote").bind("click",this,function() {
		if(confirm('Are you sure you want to delete this note?')) {
			$.blockUI({message: '<h2>Deleting note...</h2>'});
			var nNoteID = $.Replace(this.id,'Note','');
			
			//DELETE AJAX NOTES
			$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: 'deleteNote', NoteID: nNoteID, returnFormat: 'plain'},
				function(data) {
					if(data.STATUS) {
						parent.addMessage(data.STATUSMSG,250,2500,2500);
						$("#Note" + nNoteID).hide();
						$.unblockUI();
					} else {
						parent.addError(data.STATUSMSG,250,2500,2500);
						$.unblockUI();
					} //END IF STATUS
			}); //END AJAX GET
		} // END IF CONFIRM
	});	
	
	$(".addNote").bind("click", this, function() {
		var sBody = $("#NoteBody").val();
		$.blockUI({message: '<h2>Adding note...</h2>'});
		
		//ADD AJAX NOTES
		$.getJSON(sRootPath + "/_com/AJAX_Activity.cfc", { method: 'saveNote', ActivityID: nActivity, NoteBody: sBody, returnFormat: 'plain'},
				function(data) {
					if(data.STATUS) {
						parent.addMessage(data.STATUSMSG,250,2500,2500);
						window.location = sMyself + "Activity.Notes?ActivityID=" + nActivity;
					} else {
						$("#NoteBody").val("");
						parent.addError(data.STATUSMSG,250,2500,2500);
						$.unblockUI();
					} //END IF STATUS
			}); //END AJAX GET
	});
});
</script>
<cfoutput>
<div id="AddNote">
	<form action="" name="frmCreateNote" method="post" class="MainForm">
		<table width="100%" cellspacing="1" cellpadding="1" border="0">
			<tr>
				<td><textarea name="NoteBody" id="NoteBody" style="height:40px;width:280px;font-size:15px; padding:2px;font-weight:bold;font-family:Verdana, Arial, Helvetica, sans-serif;">#Attributes.NoteBody#</textarea></td>
				<td><input type="button" name="AddNote" id="AddNote" class="addNote" value="Add" style="height:45px;" /></td>
			</tr>
		</table>
	</form>
</div>
<cfif qActivityNotes.RecordCount GT 0>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ViewSectionGrid">
	<cfloop query="qActivityNotes">
		<tr id="Note#qActivityNotes.NoteID#">
			<td>
				<div style="font-size:18px;">&quot;#qActivityNotes.Body#&quot;</div>
				<h4 style="margin:0px;font-size:12px;font-weight:normal;">Posted by <a href="#myself#Person.Detail?PersonID=#qActivityNotes.CreatedBy#" target="_parent" title="View Profile">#qActivityNotes.CreatedByFName# #Left(qActivityNotes.CreatedByLName, 1)#.</a> on #DateFormat(qActivityNotes.Created,"MMM DD, YYYY")# at #TimeFormat(qActivityNotes.Created,"h:mm TT")#</h4>
			</td>
			<td><a href="javascript:void(0);" class="DeleteNote" id="Note#qActivityNotes.NoteID#" title="Delete This Note"><img src="#Application.Settings.RootPath#/_images/icons/bin.png"></a></td>
		</tr>
	</cfloop>
</table>
<cfelse>
	<p>No Notes Exist</p>
</cfif>
</cfoutput>
