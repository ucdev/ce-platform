<cfparam name="Attributes.Action" default="">


<cfoutput>
<div style="padding:4px;">
    <form name="frmUpload" id="frmFileUpload" enctype="multipart/form-data">
		<p><strong>Document</strong><br />
        	<input type="file" name="FileField" /></p>
        <p><strong>Brief Caption</strong><br />
        	<textarea name="FileCaption">#Attributes.FileCaption#</textarea>
        <p><strong>File Type</strong><br />
            <cfloop query="qFileTypeList">
                <cfif qFileTypeList.Description EQ "People">
                    <input type="radio" name="FileType" value="#qFileTypeList.FileTypeID#"<cfif Attributes.FileType EQ qFileTypeList.FileTypeID> CHECKED</cfif> />#qFileTypeList.Name#</option>
                </cfif>
            </cfloop></p>
    </form>
</div>
</cfoutput>