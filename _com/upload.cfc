<cfcomponent displayname="Upload" output="no">
	<cfinclude template="/_com/_UDF/getExtension.cfm" />
	
	<cffunction name="Uploader" access="remote" output="no" returnformat="plain">
		<cfargument name="formfield" />
		<cfargument name="mode" required="no" default="image" type="string" />
		
		<cfset var statusMsg = "|||fail">
			<cfswitch expression="#Arguments.Mode#">
				<cfcase value="image">
					<cfset AcceptExt = "JPG,JPEG,GIF,PNG" />
					<cfset FileBase = ExpandPath('/_uploads/images/')>
					
					<cffile action="upload" filefield="#arguments.formfield#" destination="#FileBase#_original\" nameConflict = "MakeUnique" result="fileResult">
				</cfcase>
				
				<!---<cfcase value="video">
					<cfset AcceptExt = "avi,asx,mjpg,mov,mpg,mp4,mpeg,qt,rv,wmv">
					<cfset FileBase = ExpandPath('../_uploads/videos/')>
					
					<cffile action="upload" filefield="#arguments.formfield#" destination="#FileBase#_originals\" nameConflict = "MakeUnique" result="fileResult">
				</cfcase>--->
			</cfswitch>
			
			<cfset statusMsg = "success">
			
			<cfif NOT ListFindNoCase(AcceptExt,fileResult.serverfileext,',')>
				<cffile action="delete" file="#FileBase#_original/#lcase(fileResult.serverfile)#">
				<cfset statusMsg = "deleted_file.X|none|.X|fail">
			<cfelse>
				<cfset statusMsg = lcase(fileResult.serverfile) & "|" & lcase(fileResult.contenttype) & "|" & lcase(fileResult.serverfileext) & "|" & statusMsg />
			</cfif>
			
			<cfreturn statusMsg>
		
	</cffunction>
	
	<cffunction name="imageHandler" access="remote" output="no">
		<cfargument name="filename" type="string" required="yes" />
		<cfargument name="contenttype" type="string" required="yes" />
		<cfargument name="fileext" type="string" required="yes" />
		<cfargument name="type" type="numeric" required="yes" />
		<cfargument name="key" type="numeric" required="no" default="0" />
		<cfargument name="makeprimary" type="string" required="no" default="false" />
		
		<!--- variables --->
		<cfset var imagePath = ExpandPath('/_uploads/images/')>
		<cfset var imageType = application.com.imageType.getimageTypes(id=arguments.type) />
		
		<cfset imageBean = CreateObject("component","_com.image.image").init()>
		<cfset imageBean.setCaption(arguments.filename)>
		<cfset imageBean.setimageType_id(arguments.type)>
		<cfset imageBean.setdata_key(arguments.typeid)>
		<cfset imageBean.setfile_Ext(arguments.fileext)>
		<cfset imageBean.setID(Application.Com.imageDAO.Create(imageBean))>
		<cfset imageBean = Application.Com.imageDAO.Read(imageBean)>
		<cfset imageBean.setOrig_filename(arguments.filename)>
		<cfset imageBean.setFileName(imageBean.getID() & "." & arguments.fileext)>
		<cfset application.com.imageDAO.Update(imageBean)>

		<!--- RESIZE --->
		<cfset oImage = ImageRead("#imagePath#_original/#arguments.filename#")>
		<cfset ImageSetAntialiasing(oImage,"on")>
		<cfset FullSize = 650>
		<cfset ProfileSize = 220>
		<cfset AlbumSize = 130>
		<cfset ThumbSize = 94>
		<cfset IconSize = 52>

		<cfset oImageInfo = ImageInfo(oImage)>

		<!--- FULL RESIZE: Max Width 650px --->
		<cfif oImageInfo.width GTE FullSize>
			<cfset ImageScaleToFit(oImage, FullSize, "","highestquality")>
		</cfif>
		<cfset TheSize = "f">
		<cfset TheFileName = formatFileName(arguments.type,imageBean.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,imagePath & TheFileName)>
		
		<!--- PROFILE RESIZE: Max Width 220px --->
		<cfif oImageInfo.width GTE ProfileSize>
			<cfset ImageScaleToFit(oImage, ProfileSize, "","highestquality")>
		</cfif>
		<cfset TheSize = "p">
		<cfset TheFileName = formatFileName(arguments.type,imageBean.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,imagePath & TheFileName)>
		
		<!--- ALBUM RESIZE: Max Width 130px --->
		<!--- resize image to 75 pixels tall if width is greater then height --->
		<cfif oImage.height GT oImage.width>
		 
			<cfset ImageResize(oImage,AlbumSize,'')>
			<cfset offSet = ceiling(AlbumSize / 2 ) />
			<cfset fromX = oImage.Height / 2 - offSet>
			<cfset ImageCrop(oImage,0,fromX,AlbumSize,AlbumSize)>
		 
		<!--- resize image to 75 pixels wide if height is greater then width --->
		<cfelseif oImage.width GT oImage.height>
		 
			<cfset ImageResize(oImage,'',AlbumSize)>
			<cfset offSet = ceiling(AlbumSize / 2 ) />
			<cfset fromY = oImage.Width / 2 - offSet>
			<cfset ImageCrop(oImage,fromY,0,AlbumSize,AlbumSize)>
		 
		<cfelse>
			<cfset ImageResize(oImage,'',AlbumSize)>
			<cfset ImageCrop(oImage,0,0,AlbumSize,AlbumSize)>
		</cfif>
		
		<cfset TheSize = "a">
		<cfset TheFileName = formatFileName(arguments.type,imageBean.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,imagePath & TheFileName)>
		
		<!--- THUMB RESIZE: Max Width 94px --->
		
		<cfif oImageInfo.width GTE ThumbSize>
			<cfset ImageScaleToFit(oImage, ThumbSize, "","highestquality")>
		</cfif>
		
		<cfset TheSize = "t">
		<cfset TheFileName = formatFileName(arguments.type,imageBean.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,imagePath & TheFileName)>
		
		<!--- ICON RESIZE: Max Width 50px --->
		<cfif oImageInfo.width GTE IconSize>
			<cfset ImageScaleToFit(oImage, IconSize, "","highestquality")>
		</cfif>
		
		<cfset TheSize = "i">
		<cfset TheFileName = formatFileName(arguments.type,imageBean.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,imagePath & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
		
		<cfreturn "#imageBean.getPhotoID()#|#imageBean.getCaption()#|#formatFileName(arguments.type,imageBean.getPhotoID(),'t',arguments.fileext)#|#arguments.fileext#">
	</cffunction>
	
	<cffunction name="formatFileName" access="private" output="no" returntype="string">
		<cfargument name="type" type="string" required="yes" />
		<cfargument name="photoid" type="string" required="yes" />
		<cfargument name="size" type="string" required="yes" />
		<cfargument name="ext" type="string" required="yes" />
		
		<cfset var FileTemplate = "%photoid%_%size%.%ext%">
		<cfset var ReturnFile = "">
		
		<cfset ReturnFile = Replace(FileTemplate,"%type%","#Arguments.type#")>
		<cfset ReturnFile = Replace(ReturnFile,"%photoid%","#Arguments.photoid#")>
		<cfset ReturnFile = Replace(ReturnFile,"%size%","#Arguments.size#")>
		<cfset ReturnFile = Replace(ReturnFile,"%ext%","#Arguments.ext#")>
		
		<cfset ReturnFile = LCase(ReturnFile)>
		
		<cfreturn ReturnFile>
	</cffunction>
</cfcomponent>