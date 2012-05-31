<cfcomponent>
	<cfset variables.instance = StructNew() />
    
	<cffunction name="init" returntype="_com.returnData.userStruct" access="public" output="no">
        <cfargument name="user" type="struct" required="false" default="#{'userid':0,'userappid':0,'fb_userid':0,'pictureurl':'http://gravatar.com/avatar/nothing?d=identicon','displayname':'_no_name','reputation':0}#" />
        <cfargument name="userid" type="numeric" required="false" default="0" />
		<cfargument name="userappid" type="numeric" required="false" default="0" />
		<cfargument name="fb_userid" type="numeric" required="false" default="0" />
        <cfargument name="pictureurl" type="string" required="false" default="http://gravatar.com/avatar/nothing?d=identicon" />
        <cfargument name="displayname" type="string" required="false" default="_no_name" />
        <cfargument name="reputation" type="numeric" required="false" default="0" />
        
		<cfset setUser(arguments.user)>
		<cfset setUserID(arguments.userid)>
		<cfset setUserAppID(arguments.userappid)>
		<cfset setFB_UserID(arguments.fb_userid)>
		<cfset setPictureURL(arguments.pictureurl)>
		<cfset setDisplayName(arguments.displayname)>
		<cfset setReputation(arguments.reputation)>
		
		<cfreturn this />
	</cffunction>
    
    <!--- DUMP FUNCTION --->
	<cffunction name="dump" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>
    
	<cffunction name="getUser" access="public" returntype="struct" output="false">
		<cfreturn variables.instance.user />
	</cffunction>
	
	<cffunction name="setUser" access="public" returntype="void" output="false">
		<cfargument name="user" type="struct" required="true" />
		
		<cfset this.setUserID(arguments.user.userid)>
		<cfset this.setUserAppID(arguments.user.userappid)>
		<cfset this.setFB_UserID(arguments.user.fb_userid)>
		<cfset this.setPictureURL(arguments.user.pictureurl)>
		<cfset this.setDisplayName(arguments.user.displayname)>
		<cfset this.setReputation(arguments.user.reputation)>
		
		<cfset variables.instance.user = {userid:this.getUserID(),userappid:this.getUserAppId(),fb_userid:this.getFB_userId(),pictureurl:this.getPictureURL(),displayname:this.getDisplayName(),reputation:this.getReputation()} />
	</cffunction>
	
	<cffunction name="getUserID" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.userid />
	</cffunction>
	
	<cffunction name="setUserID" access="public" returntype="void" output="false">
		<cfargument name="userid" type="numeric" required="true" />
		<cfset variables.instance.userid = arguments.userid />
	</cffunction>
	
	<cffunction name="getReputation" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.Reputation />
	</cffunction>
	
	<cffunction name="setReputation" access="public" returntype="void" output="false">
		<cfargument name="Reputation" type="numeric" required="true" />
		<cfset variables.instance.Reputation = arguments.Reputation />
	</cffunction>
	
	<cffunction name="getUserAppID" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.UserAppID />
	</cffunction>
	
	<cffunction name="setUserAppID" access="public" returntype="void" output="false">
		<cfargument name="UserAppID" type="numeric" required="true" />
		<cfset variables.instance.UserAppID = arguments.UserAppID />
	</cffunction>
	
	<cffunction name="getFB_UserID" access="public" returntype="numeric" output="false">
		<cfreturn variables.instance.FB_UserID />
	</cffunction>
	
	<cffunction name="setFB_UserID" access="public" returntype="void" output="false">
		<cfargument name="FB_UserID" type="numeric" required="true" />
		<cfset variables.instance.FB_UserID = arguments.FB_UserID />
	</cffunction>
	
	<cffunction name="getPictureURL" access="public" returntype="string" output="false">
		<cfreturn variables.instance.PictureURL />
	</cffunction>
	
	<cffunction name="setPictureURL" access="public" returntype="void" output="false">
		<cfargument name="PictureURL" type="string" required="true" />
		<cfset variables.instance.PictureURL = arguments.PictureURL />
	</cffunction>
	
	<cffunction name="getDisplayName" access="public" returntype="string" output="false">
		<cfreturn variables.instance.DisplayName />
	</cffunction>
	
	<cffunction name="setDisplayName" access="public" returntype="void" output="false">
		<cfargument name="DisplayName" type="string" required="true" />
		<cfset variables.instance.DisplayName = arguments.DisplayName />
	</cffunction>
    
</cfcomponent>