<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_File")>
        <cfset property(name="id", column="FileID") />
        <!---<cfset setPrimaryKey(property="id") />--->
    </cffunction>
    
    <cffunction name="doUpload">
		<cfset var status = createObject("component", "#Application.Settings.Com#returnData.buildStruct").init()>
        
        <cfif Len(this.fileName) LTE 0>
        	<cfset status.addError("fileName","You must select a File.")>
        </cfif>
        
        <cfif len(trim(this.FileTypeID)) EQ 0>
        	<cfset status.addError("fileType","You must select a File Type.")>
        </cfif>
        
        <cfif arrayLen(status.getErrors()) EQ 0>
            <!--- Main Upload Path --->
            <cfset FilePath = "#ExpandPath(".\files\_uploads")#">
            
            <!--- Set Mode Specifics --->
            <cfif len(trim(this.personId)) GT 0>
	            <cfset ExtendedPath = FilePath & "\PersonFiles\" & this.personId />
            <cfelse>
	            <cfset ExtendedPath = FilePath & "\ActivityFiles\" & this.activityId />
            </cfif>
            
            <!--- Create MODE Folder --->
            <cfif NOT DirectoryExists(ExtendedPath)>
                <cfdirectory action="Create" directory="#ExtendedPath#" />
            </cfif>
        
                <cffile
                    action="upload"
                    destination="#ExtendedPath#\"
                    filefield="FORM.file[fileName]"
                    nameconflict="makeunique" />
                    
                <cfset NewFileName = cffile.ServerFile>
                
                <cfif cffile.serverFileExt EQ "avi" OR cffile.serverFileExt EQ "asx" OR cffile.serverFileExt EQ "mjpg" OR cffile.serverFileExt EQ "mov" OR cffile.serverFileExt EQ "mpeg" OR cffile.serverFileExt EQ "qt" OR cffile.serverFileExt EQ "rv" OR cffile.serverFileExt EQ "wmv">
                    
                    <cfset FFPath = "#ExpandPath("./_ffmpeg")#">
                    
                    <cfset newfile = "#REPLACELIST(cffile.ServerFile, ' ', '')#">
                    <cfset cffile.ServerFile = "#REPLACELIST(cffile.ServerFile, ' ', '')#">
                    
                    <cfset newflv = "#replace(newfile, ".", "")#.flv">
                    <cfset newjpg = "#replace(newfile, ".", "")#.jpg">
                    
                    <cfset NewFileName = newflv>
                    
                    <!--- convert the video with FFMPEG ---> 
                    <cfexecute name = "#FFPath#\ffmpeg.exe" 
                        arguments = "-i #ExtendedPath#\#cffile.ServerFile# -s 424x344 -r 15 -b 200k -ar 44100 -ab 64 -ac 2 #ExtendedPath#\#newflv#"  
                        timeout = "90000000"> 
                    </cfexecute> 
                    
                    <cfexecute name = "#FFPath#\ffmpeg.exe" 
                        arguments = "-i #ExtendedPath#\#cffile.ServerFile# -y -f image2 -ss 16 -sameq -t 0.001 -s 424x334 #ExtendedPath#\#newjpg#" 
                        timeout = "90000000"> 
                    </cfexecute> 
                    
                </cfif>
                
                <cfset this.fileName = newFileName>
                <cfset this.fileSize = cffile.fileSize>
                <cfset this.createdBy = session.currentUser.id>
                
                <cfset status.setStatus(true) />
                <cfset status.setPayload(cffile) />
            <cftry>
                <cfcatch>
                    <cfset status.addError("general","Error Uploading File: #CFCATCH.Message#")>
                </cfcatch>
            </cftry>
        </cfif>
        
        <cfreturn status />
    </cffunction>
</cfcomponent>
