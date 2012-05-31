<cfcomponent name="imageService" output="false">

	<cffunction name="init" access="public" output="false" returntype="_com.image.imageService">
		<cfargument name="imageDAO" type="_com.image.imageDAO" required="true" />
		<cfargument name="imageGateway" type="_com.image.imageGateway" required="true" />

		<cfset variables.imageDAO = arguments.imageDAO />
		<cfset variables.imageGateway = arguments.imageGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="getimage" access="public" output="false" returntype="image">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var image = createObject("component","_com.image.image").init(argumentCollection=arguments) />
		<cfif image.getimageID() eq 0>
			<cfreturn image />
		<cfelse>
			<cfreturn variables.imageDAO.read(image) />
		</cfif>
	</cffunction>

	<cffunction name="getimages" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="imagetype_id" type="string" required="false" />
		<cfargument name="data_key" type="numeric" required="false" />
		<cfargument name="caption" type="string" required="false" />
		<cfargument name="filename" type="string" required="false" />
		<cfargument name="file_ext" type="string" required="false" />
		<cfargument name="orig_filename" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		
		<cfreturn variables.imageGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="saveimage" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="imagetype_id" type="string" required="false" />
		<cfargument name="data_key" type="numeric" required="false" />
		<cfargument name="caption" type="string" required="false" />
		<cfargument name="filename" type="string" required="false" />
		<cfargument name="file_ext" type="string" required="false" />
		<cfargument name="orig_filename" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		<cfargument name="created_by" type="numeric" required="false" />
		
		
		<cfset var image = getimage(arguments.id) />
		<cfset image.setid(arguments.id) />
		<cfif structKeyExists(arguments,"imagetype_id")>
			<cfset image.setimagetype_id(arguments.imagetype_id) />
		</cfif>
		<cfif structKeyExists(arguments,"data_key")>
			<cfset image.setdata_key(arguments.data_key) />
		</cfif>
		<cfif structKeyExists(arguments,"caption")>
			<cfset image.setcaption(arguments.caption) />
		</cfif>
		<cfif structKeyExists(arguments,"filename")>
			<cfset image.setfilename(arguments.filename) />
		</cfif>
		<cfif structKeyExists(arguments,"file_ext")>
			<cfset image.setfile_ext(arguments.file_ext) />
		</cfif>
		<cfif structKeyExists(arguments,"orig_filename")>
			<cfset image.setorig_filename(arguments.orig_filename) />
		</cfif>
		<cfif structKeyExists(arguments,"created")>
			<cfset image.setcreated(arguments.created) />
		</cfif>
		<cfif structKeyExists(arguments,"created_by")>
			<cfset image.setcreated_by(arguments.created_by) />
		</cfif>
		<cfreturn variables.imageDAO.save(image) />
	</cffunction>

	<cffunction name="deleteimage" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var image = createObject("component","_com.image.image").init(argumentCollection=arguments) />
		<cfreturn variables.imageDAO.delete(image) />
	</cffunction>
	
	<cffunction name="handler" access="remote" output="no">
		<cfargument name="filename" type="string" required="yes" />
		<cfargument name="contenttype" type="string" required="yes" />
		<cfargument name="fileext" type="string" required="yes" />
		<cfargument name="type" type="string" required="yes" />
		<cfargument name="typeid" type="string" required="no" default="0" />
		<cfargument name="albumid" type="string" required="no" default="0" />
		<cfargument name="makeprimary" type="string" required="no" default="false" />
		
		<cfset PhotoBase = ExpandPath('/_uploads/images/')>
		
		<!--- set type 
		<cfswitch expression="#Arguments.Type#">
			<cfcase value="C">
				<cfset TheType = "car" />
				
				<cfset CarInfo = Application.Com.CarGateway.getByViewAttributes(CarID=arguments.typeid)>
				
				<cfif Session.UserID NEQ CarInfo.UserID>
					PERMISSION DENIED!<cfabort>
				</cfif>
			</cfcase>
			<cfcase value="M">
				<cfset TheType = "mod" />

				<cfset CarModInfo = Application.Com.CarModGateway.getByAttributes(CarModID=arguments.typeid)>
				<cfset CarInfo = Application.Com.CarGateway.getByViewAttributes(CarID=CarModInfo.CarID)>
				
				<cfif Session.UserID NEQ CarInfo.UserID>
					PERMISSION DENIED!<cfabort>
				</cfif>
			</cfcase>
			<cfcase value="U">
				<cfset TheType = "user" />
				
				<cfset UserInfo = Application.Com.UserGateway.getByAttributes(UserID=arguments.typeid)>
				
				<cfif Session.UserID NEQ UserInfo.UserID>
					PERMISSION DENIED!<cfabort>
				</cfif>
			</cfcase>
			<cfcase value="CM">
				<cfset TheType = "community" />
				
				<cfquery name="CommunityInfo" datasource="#Application.Settings.DSN#">
					EXEC getCommunityInfo @CommunityID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				
				<cfif Session.UserID NEQ CommunityInfo.OwnerID>
					PERMISSION DENIED!<cfabort>
				</cfif>
			</cfcase>
			<cfcase value="E">
				<cfset TheType = "event" />
				
				<cfset EventInfo = Application.Com.EventGateway.getByAttributes(EventID=arguments.typeid)>
				
				<!---<cfif Session.UserID NEQ EventInfo.CreatedBy>
					PERMISSION DENIED!<cfabort>
				</cfif>--->
			</cfcase>
			<cfcase value="CB">
				<cfset TheType = "club" />
				
				<cfset ClubInfo = Application.Com.ClubGateway.getByAttributes(ClubID=arguments.typeid)>
				
				<!---<cfif Session.UserID NEQ ClubInfo.CreatedBy>
					PERMISSION DENIED!<cfabort>
				</cfif>--->
			</cfcase>
			<cfcase value="KS">
				<cfset TheType = "karshow" />
				
				<cfset KarshowInfo = Application.Com.KarshowGateway.getByAttributes(KarshowID=arguments.typeid)>
				<!---
				<cfif Session.UserID NEQ KarshowInfo.OwnerID>
					PERMISSION DENIED!<cfabort>
				</cfif>--->
			</cfcase>
			<cfdefaultcase>
				INVALID UPLOAD TYPE!<cfabort>
			</cfdefaultcase>
		</cfswitch>
		---><!---
		<cfset S3FileKey = "photos/">--->
		<!---<cfset Application.S3.putObject("urkar-uploads",S3FileKey & "_original/" & arguments.filename,arguments.contentType)>--->
		
		<cfset Photo = CreateObject("component","_com.image.image").init()>
		
		<cfset Photo.setAlbumID(arguments.albumid)>
		<cfset Photo.setCaption(arguments.filename)>
		<cfset Photo.setFileName("")>
		<cfset Photo.setFileExt(arguments.fileext)>
		<cfset Photo.setUploaded(now())>
		<cfset Photo.setPhotoID(Application.Com.PhotoDAO.Create(Photo))>
		<cfset Photo = Application.Com.PhotoDAO.Read(Photo)>
		
		<cfswitch expression="#Arguments.Type#">
			<cfcase value="C">
				<cfset Photo.setObjectTypeID(1)>
				<cfset Photo.setCarID(Arguments.TypeID)>
			</cfcase>
			<cfcase value="CB">
				<cfset Photo.setObjectTypeID(5)>
				<cfset Photo.setClubID(Arguments.TypeID)>
				
				<cfif Arguments.typeid GT 0 AND Arguments.MakePrimary>
				<cfquery name="qPrimary" datasource="#Application.Settings.DSN#">
					UPDATE ur_Club
					SET PrimaryPhotoID=<cfqueryparam value="#Photo.getPhotoID()#" cfsqltype="cf_sql_integer" />
					WHERE ClubID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				</cfif>
			</cfcase>
			<cfcase value="KS">
				<cfset Photo.setObjectTypeID(3)>
				<cfset Photo.setEventID(Arguments.TypeID)>
				
				<cfif Arguments.typeid GT 0 AND Arguments.MakePrimary>
				<cfquery name="qPrimary" datasource="#Application.Settings.DSN#">
					UPDATE ur_Karshow
					SET PrimaryPhotoID=<cfqueryparam value="#Photo.getPhotoID()#" cfsqltype="cf_sql_integer" />
					WHERE KarshowID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				</cfif>
			</cfcase>
			<cfcase value="E">
				<cfset Photo.setObjectTypeID(4)>
				<cfset Photo.setEventID(Arguments.TypeID)>
				
				<cfif Arguments.typeid GT 0 AND Arguments.MakePrimary>
				<cfquery name="qPrimary" datasource="#Application.Settings.DSN#">
					UPDATE ur_Event
					SET PrimaryPhotoID=<cfqueryparam value="#Photo.getPhotoID()#" cfsqltype="cf_sql_integer" />
					WHERE EventID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				</cfif>
			</cfcase>
			<cfcase value="M">
				<cfset Photo.setObjectTypeID(7)>
				<cfset Photo.setCarModID(Arguments.TypeID)>
			</cfcase>
			<cfcase value="CM">
				<cfset Photo.setObjectTypeID(8)>
				<cfset Photo.setCommunityID(Arguments.TypeID)>
				
				<cfif Arguments.typeid GT 0 AND Arguments.MakePrimary>
				<cfquery name="qPrimary" datasource="#Application.Settings.DSN#">
					UPDATE ur_Community
					SET PrimaryPhotoID=<cfqueryparam value="#Photo.getPhotoID()#" cfsqltype="cf_sql_integer" />
					WHERE CommunityID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				</cfif>
			</cfcase>
			<cfcase value="U">
				<cfset Photo.setObjectTypeID(2)>
				<cfset Photo.setUserID(Arguments.TypeID)>
				
				<cfif Arguments.typeid GT 0 AND Arguments.MakePrimary>
				<cfquery name="qPrimary" datasource="#Application.Settings.DSN#">
					UPDATE ur_User
					SET PrimaryPhotoID=<cfqueryparam value="#Photo.getPhotoID()#" cfsqltype="cf_sql_integer" />
					WHERE UserID=<cfqueryparam value="#Arguments.TypeID#" cfsqltype="cf_sql_integer" />
				</cfquery>
				
				<cfset Session.User.setPrimaryPhotoID(Photo.getPhotoID())>
				</cfif>
			</cfcase>
		</cfswitch>
		
		<cfset Photo.setFileName(Photo.getPhotoID() & "." & arguments.fileext)>
		<cfset Application.Com.PhotoDAO.Update(Photo)>
		
		<!---<cfswitch expression="#TheType#">
			<cfcase value="car">
				<cfset CarPhoto = CreateObject("component","_com.CarPhoto.CarPhoto").init()>
				<cfset CarPhoto.setCarID(CarInfo.CarID)>
				<cfset CarPhoto.setPhotoID(Photo.getPhotoID())>
				<cfset CarPhoto.setTagged(now())>
				<cfset CarPhoto.setTaggedBy(Session.UserID)>
				<cfset Application.Com.CarPhotoDAO.Create(CarPhoto)>
			</cfcase>
			<cfcase value="user">
				<cfset UserPhoto = CreateObject("component","_com.UserPhoto.UserPhoto").init()>
				<cfset UserPhoto.setUserID(Session.UserID)>
				<cfset UserPhoto.setPhotoID(Photo.getPhotoID())>
				<cfset UserPhoto.setTagged(now())>
				<cfset UserPhoto.setTaggedBy(Session.UserID)>
				<cfset Application.Com.UserPhotoDAO.Create(UserPhoto)>
			</cfcase>
			<cfcase value="mod">
				<cfset CarModPhoto = CreateObject("component","_com.CarModPhoto.CarModPhoto").init()>
				<cfset CarModPhoto.setCarModID(CarModInfo.CarModID)>
				<cfset CarModPhoto.setPhotoID(Photo.getPhotoID())>
				<cfset CarModPhoto.setTagged(now())>
				<cfset CarModPhoto.setTaggedBy(Session.UserID)>
				<cfset Application.Com.CarModPhotoDAO.Create(CarModPhoto)>
			</cfcase>
		</cfswitch>--->
		
		<!--- RESIZE --->
		<cfset oImage = ImageRead("#PhotoBase#_original/#arguments.filename#")>
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
		<cfset TheFileName = formatFileName(arguments.type,Photo.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,PhotoBase & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
		<!--- PROFILE RESIZE: Max Width 220px --->
		<cfif oImageInfo.width GTE ProfileSize>
			<cfset ImageScaleToFit(oImage, ProfileSize, "","highestquality")>
		</cfif>
		<cfset TheSize = "p">
		<cfset TheFileName = formatFileName(arguments.type,Photo.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,PhotoBase & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
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
		<cfset TheFileName = formatFileName(arguments.type,Photo.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,PhotoBase & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
		<!--- THUMB RESIZE: Max Width 94px --->
		
		<cfif oImageInfo.width GTE ThumbSize>
			<cfset ImageScaleToFit(oImage, ThumbSize, "","highestquality")>
		</cfif>
		
		<cfset TheSize = "t">
		<cfset TheFileName = formatFileName(arguments.type,Photo.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,PhotoBase & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
		<!--- ICON RESIZE: Max Width 50px --->
		<cfif oImageInfo.width GTE IconSize>
			<cfset ImageScaleToFit(oImage, IconSize, "","highestquality")>
		</cfif>
		
		<cfset TheSize = "i">
		<cfset TheFileName = formatFileName(arguments.type,Photo.getPhotoID(),TheSize,arguments.fileext)>
		<cfset ImageWrite(oImage,PhotoBase & TheFileName)><!---
		<cfset Application.S3.putObject("urkar-uploads",S3FileKey & TheFileName,arguments.contentType)>--->
		
		
		<cfreturn "#Photo.getPhotoID()#|#Photo.getCaption()#|#formatFileName(arguments.type,Photo.getPhotoID(),'t',arguments.fileext)#|#arguments.fileext#">
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
