<cfparam name="params.fileCaption" default="">
<cfparam name="params.fileType" default="">
<cfparam name="params.activityId" default="0">
<cfoutput>
#startFormTag(controller="files", action="create", key=params.key, id="frmFileUpload", class="form-horizontal form-ccpd", multipart=true)#
    <fieldset>
    	#hiddenFieldTag(name="keyType", value=params.keyType)#
        #hiddenFieldTag(name="activityId", value=params.activityId)#
        <div class="control-group">
            <label for="file-fileName" class="control-label">File</label>
            <div class="controls">
                <div class="input-append">
                	#fileField(objectName="file", property="fileName", label="")#
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="file-fileCaption" class="control-label">Caption</label>
            <div class="controls">
                <div class="input-append">
                	#textArea(objectName="file", property="fileCaption", label="")#
                </div>
            </div>
        </div>
        <div class="control-group">
            <label for="file-fileTypeId" class="control-label">Type</label>
            <div class="controls">
                <div class="input-append">
                	#select(objectName="file", property="fileTypeId", options=fileTypeList, label="", includeBlank=true)#
                </div>
            </div>
        </div>
	</fieldset>
#endFormTag()#
</cfoutput>