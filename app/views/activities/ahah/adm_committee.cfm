<script>
$(document).ready(function() {
	/* PHOTO UPLOAD DIALOG */
	$("#PhotoUpload").dialog({ 
		title:"Upload Photo",
		modal: false, 
		autoOpen: false,
		height:120,
		width:450,
		resizable: false,
		open:function() {
			$("#PhotoUpload").show();
		}
	});
	
	$("img.PersonPhoto").click(function() {
		var nPersonID = $.Replace(this.id,"Photo","","ALL");
		$("#frmUpload").attr("src",sMyself + "Person.PhotoUpload?PersonID=" + nPersonID + "&ElementID=" + this.id);
		$("#PhotoUpload").dialog("open");
	});
	/* // END PHOTO UPLOAD DIALOG */
	
	$("#PersonDetail").dialog({ 
			title: "Person Detail",
			modal: true, 
			autoOpen: false,
			height:550,
			width:855,
			position:[100,100],
			resizable: false,
			dragStop: function(ev,ui) {
				
			},
			open:function() {
				$("#frameDetail").attr('src',sMyself + 'Person.Detail?PersonID=' + nPersonID + '&Mini=1');
			},
			close:function() {
				
			},
			resizeStop:function(ev,ui) {
			}
		});
				
	$(".PersonLink").click(function() {
		nPersonID = $.ListGetAt(this.id,2,"|");
		sPersonName = $.ListGetAt(this.id,3,"|");

		$("#PersonDetail").dialog("open");
		return false;
	});
	
	/* CHECK/UNCHECK ALL CHECKBOXES */
	$("#CheckAll").click(function() {
		if($("#CheckAll").attr("checked")) {
			$(".MemberCheckbox").each(function() {
				$(this).attr("checked",true);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$(".AllCommittee").css("background-color","#FFD");
			});
		} else {
			$(".MemberCheckbox").each(function() {
				$(this).attr("checked",false);
				
				// CHANGE BACKGROUND COLOR OF PERSONROW
				$(".AllCommittee").css("background-color","#FFF");
			});
		}
	}); 
	
	$(".MemberCheckbox").bind("click", this, function() {
		if($(this).attr("checked")) {
			var nPersonID = $.Replace(this.id,"Checked","","ALL");
			$("#PersonRow" + nPersonID).css("background-color","#FFD");
		} else {
			var nPersonID = $.Replace(this.id,"Checked","","ALL");
			$("#PersonRow" + nPersonID).css("background-color","#FFF");
		}
	});
});
</script>
<style>
.PersonPhoto { width:50px; }
</style>
<cfoutput>

<cfif qActivityCommitteeList.RecordCount GT 0>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ViewSectionGrid DetailView">
	<thead>
		<tr>
			<th width="15"><input type="checkbox" name="CheckAll" id="CheckAll" /></th>
			<th colspan="2">Information</th>
			<th>Role</th>
		</tr>
	</thead>
	<tbody>
		<cfloop query="qActivityCommitteeList">
			<tr id="PersonRow#PersonID#" class="AllCommittee">
				<td valign="top"><input type="checkbox" name="Checked" class="MemberCheckbox" id="Checked#PersonID#" value="#PersonID#" /></td>
				<td valign="top" width="70" style="text-align:center;"><cfif FileExists(ExpandPath(".\_uploads\PersonPhotos\#PersonID#.jpg"))><img src="/admin/_uploads/PersonPhotos/#PersonID#.jpg" id="Photo#PersonID#" class="PersonPhoto" /><cfelse><img src="#Application.Settings.RootPath#/_images/icon_<cfif Gender EQ "F">female<cfelse>male</cfif>.gif" id="Photo#PersonID#" class="PersonPhoto" /></cfif></td>
				<td valign="top"><a href="#myself#Person.Detail?PersonID=#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#">#FirstName# #LastName#</a></td>
                <td valign="top">#qActivityCommitteeList.RoleName#</td>
			</tr>
		</cfloop>
	
	</tbody>
</table>
<cfelse>
<div style="background-image:url(/admin/_images/Sample_Committee.jpg); font-size: 18px; text-align: center; height: 250px; width: 620px;">
	<div style="padding:25px 20px;">You have not added any committee members.<br />Please click 'Add Committee Member' on the right to begin.</div>
</div>
</cfif>
</cfoutput>