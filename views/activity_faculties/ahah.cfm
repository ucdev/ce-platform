<script>
$(document).ready(function() {
});
</script>
<cfoutput>
<style>
	.CVBox {	font-size:12px!important;float:left;width:49%;border:0px solid ##007; }
	.CVBox a {  font-weight:normal!important; font-size:12px!important; text-decoration:none!important; color:##555!important; }
	.DislosureBox { font-size:12px!important;float:left;width:49%;border:0px solid ##007; }
	.DislosureBox a { font-weight:normal!important; font-size:12px!important; text-decoration:none!important;  color:##555!important;} 
</style>
<style>
.PersonPhoto { width:50px; }
</style>
<cfif qActivityFacultyList.RecordCount GT 0>
	<form name="FacultyList" method="post" id="MembersList">
	<table width="100%" cellspacing="0" cellpadding="0" border="0" class="ViewSectionGrid DetailView">
		<thead>
			<tr>
				<th width="15"><input type="checkbox" name="CheckAll" id="CheckAll" class="js-check-all" /></th>
				<th width="85%">Information</th>
				<th>Role</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="qActivityFacultyList">
				<tr id="PersonRow#PersonID#" class="AllFaculty">
					<td colspan="3">
                    	<div style="float:left; width:4%; border:0px solid ##000;"><input type="checkbox" name="Checked" class="MemberCheckbox" id="Checked#PersonID#" value="#PersonID#" /></div>
                    	<div style="float:left; width: 87%; border:0px solid ##000;">
                            <div style="float:left; width:21%; border:0px solid ##070;"><cfif FileExists(ExpandPath(".\_uploads\PersonPhotos\#PersonID#.jpg"))><img src="/_uploads/PersonPhotos/#PersonID#.jpg" id="Photo#PersonID#" class="PersonPhoto" /><cfelse><img src="/images/icon_<cfif Gender EQ "F">female<cfelse>male</cfif>.gif" id="Photo#PersonID#" class="PersonPhoto" /></cfif></div>
                            <div style="float:left; width:78%; border:0px solid ##700; padding-bottom:7px;"><a href="/people/edit/#PersonID#" class="PersonLink" id="PERSON|#PersonID#|#LastName#, #FirstName#" title="View person profile of #FirstName# #LastName#">#FirstName# #LastName#</a></div>
                            <div id="Section#qActivityFacultyList.PersonID#" style="float:left; width:78%;border:0px solid ##070;">
								<cfset FileCount = 0>
                                <div class="CVBox" id="CVBox#PersonID#">
                                    <cfif qActivityFacultyList.CVFileID NEQ "">
                                    	<cfif qActivityFacultyList.CVApproveFlag EQ "N">
                                        	<cfset CVFileApproval = "Approved">
                                        <cfelse>
                                        	<cfset CVFileApproval = "Unapprove">
                                        </cfif>
                                        
                                        <a href="#Myself#File.Download?Mode=Person&ModeID=#qActivityFacultyList.PersonID#&ID=#qActivityFacultyList.CVFileID#" title="Download the CV of #FirstName# #LastName#"><img src="/images/icons/drive_disk.png" style="padding-right:4px;" align="absmiddle" />Download CV</a>  <span style="color: <cfif qActivityFacultyList.CVApproveFlag EQ "Y">##070;<cfelseif DateDiff("yyyy",Now(),qActivityFacultyList.CVCreatedDate) LTE -3>##F00;</cfif>"> <span style="font-size:10px;">(#DateFormat(qActivityFacultyList.CVCreatedDate,"MM/DD/YYYY")#)</span></span><br />
                                        <cfif qActivityFacultyList.CVApproveFlag EQ "N">
                                        	<a href="javascript:void(0);" id="Approve|CV|#qActivityFacultyList.PersonID#" class="approveFile" title="Mark the CV of #FirstName# #LastName# as Approved"><img src="/images/icons/time.png" style="padding-right:4px;" align="absmiddle" />Mark Approved</a>
										<cfelse>
                                        	<img src="/images/icons/tick.png" style="padding-right:4px;" align="absmiddle" />Approved <a href="javascript:void(0);" id="Unapprove|CV|#qActivityFacultyList.PersonID#" class="approveFile" style="font-size:10px!important;" title="Remove the Approved status from the CV of #FirstName# #LastName#">(remove)</a>
										</cfif>
                                        <br />
                                        <cfset FileCount = FileCount + 1>
                                    </cfif>
                                    <a href="javascript:void(0);" class="UploadFile" id="File|#qActivityFacultyList.PersonID#" title="Upload a new file"><img src="/images/icons/ActionFIU.png" align="absmiddle" style="padding-right:4px;" />Upload New CV</a>
                                </div>
                                <div class="DislosureBox" id="DislosureBox#PersonID#">
                                    <cfif qActivityFacultyList.DisclosureFileID NEQ "">
                                    	<cfif qActivityFacultyList.DisclosureApproveFlag EQ "N">
                                        	<cfset DisclosureFileApproval = "Approve">
                                        <cfelse>
                                        	<cfset DisclosureFileApproval = "Unapprove">
                                        </cfif>
                                        
                                        <a href="/files/download/person?ModeID=#qActivityFacultyList.PersonID#&ID=#qActivityFacultyList.DisclosureFileID#" title="Download the Disclosure of #FirstName# #LastName#"><img src="/images/icons/drive_disk.png" style="padding-right:4px;" align="absmiddle" />Download Disclosure</a> <span style="color: <cfif qActivityFacultyList.DisclosureApproveFlag EQ "Y">##070;<cfelseif DateDiff("yyyy",Now(),qActivityFacultyList.DisclosureCreatedDate) LTE -1>##F00;</cfif>"> <span style="font-size:10px;">(#DateFormat(qActivityFacultyList.DisclosureCreatedDate,"MM/DD/YYYY")#)</span></span><br /> 
                                        <cfif qActivityFacultyList.DisclosureApproveFlag EQ "N">
                                        	<a href="javascript:void(0);" id="Approve|Disclosure|#qActivityFacultyList.PersonID#" class="approveFile" title="Mark the Disclosure of #FirstName# #LastName# as Approved"><img src="/images/icons/time.png" style="padding-right:4px;" align="absmiddle" />Mark Approved</a>
										<cfelse>
                                        	<img src="/images/icons/tick.png" style="padding-right:4px;" align="absmiddle" />Approved <a href="javascript:void(0);" id="Unapprove|Disclosure|#qActivityFacultyList.PersonID#" class="approveFile" style="font-size:10px!important;" title="Remove the Approved Status from the Disclosure of #FirstName# #LastName#">(remove)</a>
										</cfif>
										<br />
                                    <cfset FileCount = FileCount + 1>
                                    </cfif>
                                    <a href="javascript:void(0);" class="UploadFile" id="File|#qActivityFacultyList.PersonID#" title="Upload a new file"><img src="/images/icons/ActionFIU.png" align="absmiddle" style="padding-right:4px;" />Upload New Disclosure</a>
                                </div>
                            </div>
                        </div>
                        <div style="float:left; border:0px solid ##000;">#qActivityFacultyList.RoleName#</div>
                    </td>
				</tr>
			</cfloop>
		</tbody>
	</table>
	</form>
<cfelse>
	<div style="background-image:url(/admin/_images/Sample_Committee.jpg); font-size: 18px; text-align: center; height: 250px; width: 620px;">
		<div style="padding:25px 20px;">You have not added any faculty members.<br />Please click 'Add Faculty Member' on the right to begin.</div>
	</div>	
</cfif>
</cfoutput>