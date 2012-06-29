<cfcomponent>
	<cfset this.imapServer = "mail.test.com">
	<cfset this.imapPort = "143">
	<cfset this.imapTimeout = "60">
	<cfset this.username = "test@test.com">
	<cfset this.password = "password">
	<cfset this.sslenabled = 0 />
	
	<cffunction name="Init" access="public" output="No">
		<cfargument name="username" required="Yes" type="string">
		<cfargument name="password" required="Yes" type="string">
		<cfargument name="server" required="No">
		<cfargument name="port" required="No">
		<cfargument name="timeout" required="No">
		<cfargument name="ssl" required="No">
		
		<cfset this.username = arguments.username>
		<cfset this.password = arguments.password>
		<cfif isdefined("arguments.server")>
			<cfset this.imapServer = arguments.server>
		</cfif>
		<cfif isdefined("arguments.port")>
			<cfset this.imapPort = arguments.port>
		</cfif>
		<cfif isdefined("arguments.timeout")>
			<cfset this.imapTimeout = arguments.timeout>
		</cfif>
		<cfif isdefined("arguments.ssl")>
            <cfset this.sslenabled = 1 />
        </cfif>
	</cffunction>

	<cffunction name="GetStore" access="private" output="No">
        <cftry>
        <cfset clsSession = createObject("Java", "javax.mail.Session")>
        <cfset objProperties = createObject("Java", "java.util.Properties")>
        <cfset objStore = createObject("Java", "javax.mail.Store")>
        <cfset Timeout = this.imapTimeout * 1000>
        <cfif this.sslenabled>
            <cfset protocol = "imaps">
        <cfelse>
            <cfset protocol = "imap">
        </cfif>
        <cfset objProperties.init()>
        <cfset objProperties.put("mail.store.protocol", protocol)>
        <cfset objProperties.put("mail.imap.port", this.imapPort)>
        <cfset objProperties.put("mail.imap.connectiontimeout", Timeout)>
        <cfset objProperties.put("mail.imap.timeout", Timeout)>
        <cfset objSession = clsSession.getInstance(objProperties)>
        <cfset objStore = objSession.getStore()>
        <cfset objStore.connect(this.imapServer, this.username, this.password)>
        <cfcatch type="any">
            You do not have a mail account or there was a problem authenticating.<cfabort>
        </cfcatch>
        </cftry>
        <cfreturn objStore>
    </cffunction>
	
	<cffunction name="OpenFolder" access="private" output="No">
		<cfargument name="objStore" required="Yes">
		<cfargument name="Folder" required="Yes" type="string">
		<cfargument name="ReadWrite" required="No" default=false type="boolean">
		<cfargument name="Create" required="No" default=false type="boolean">
		<cfset objFolder = arguments.objStore.getFolder(arguments.Folder)>
		<cfif not(objFolder.exists()) and arguments.create>
			<cfset objFolder.create(true)>
		</cfif>
		<cfif ReadWrite>
			<cfset objFolder.open(objFolder.READ_WRITE)>
		<cfelse>
			<cfset objFolder.open(objFolder.READ_ONLY)>
		</cfif>
		<cfreturn objFolder>
	</cffunction>

	<cffunction name="GetMessages" access="private" output="No">
		<cfargument name="objFolder">
		<cfargument name="messageNumber">
		<cfset Messages = "">
		<cfset Numbers = ListToArray(arguments.messageNumber)>
		<cfif ListLen(arguments.messageNumber) gt 0>
			<cfset Messages = arguments.objFolder.getMessages(Numbers)>
		<cfelse>
			<cfset Messages = arguments.objFolder.getMessages()>
		</cfif>
		<cfreturn Messages>
	</cffunction>

	<cffunction name="folderList" access="public" output="Yes">
		<cfargument name="folder" required="No" default="Inbox" type="string">
		<cfset objStore = GetStore()>
		<cfset columns = "name, parent, count, level">
		<cfset list = QueryNew(columns)>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, 0)>
		<cfset list = getFolderStructure(objFolder, "", list, 0)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn list>
	</cffunction>
	
	<cffunction name="getFolderStructure" access="private" output="Yes" returntype="query">
		<cfargument name="objFolder" required="Yes" type="any">
		<cfargument name="folder" required="yes" type="string">
		<cfargument name="list" required="yes" type="query">
		<cfargument name="level" required="Yes" type="numeric">
		<cfif len(arguments.folder)>
			<cfset arguments.objFolder = arguments.objFolder.getFolder(arguments.folder)>
		</cfif>
		<cfset Folders = arguments.objFolder.list()>
		<cfif not(isdefined("stack"))>
			<cfset stack = arrayNew(1)>
		</cfif>		
		<cfloop from="1" to="#ArrayLen(Folders)#" step="1" index="this.index">
			<cftry>
				<cfset this.path = arraytolist(stack, ".")>
				<cfif len(this.path)>
					<cfset this.path = this.path & ".">
				</cfif>
				<cfset queryAddRow(arguments.list)>
				<cfset querySetCell(arguments.list, "name", Folders[this.index].getName())>
				<cfset querySetCell(arguments.list, "parent", this.path & Folders[this.index].getParent().getName())>
				<cfset querySetCell(arguments.list, "level", arguments.level)>
				<cftry>
					<cfset querySetCell(arguments.list, "count", Folders[this.index].getMessageCount())>
					<cfcatch><cfset querySetCell(arguments.list, "count", 0)></cfcatch>
				</cftry>
				<cfcatch></cfcatch>
			</cftry>
			<cfset push(Folders[this.index].getParent().getName())>
			<cfset arguments.list = getFolderStructure(objFolder, Folders[this.index].getName(), arguments.list, arguments.level + 1)>
			<cfset pop()>
			<cfset Folders = arguments.objFolder.list()>
		</cfloop>
		<cfreturn arguments.list>
	</cffunction>
	
	<cffunction name="push" access="private" output="yes">
		<cfargument name="value" required="Yes">
		<cfif not(isdefined("stack"))>
			<cfset stack = arrayNew(1)>
		</cfif>
		<cfset arrayappend(stack, arguments.value)>
	</cffunction>

	<cffunction name="pop" access="private" output="yes">
		<cfif isdefined("stack")>
			<cfif arraylen(stack)>
				<cfset return = stack[arraylen(stack)]>
				<cfset arraydeleteat(stack, arraylen(stack))>
			</cfif>
		</cfif>
		<cfreturn return>
	</cffunction>
	
	<cffunction name="copyMessages" access="public" output="No">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="newFolder" required="Yes" type="string">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, true)>
		<cfset Messages = GetMessages(objFolder, arguments.messageNumber)>
		<cfset objFolder.copyMessages(Messages, objStore.getFolder(arguments.newFolder))>
		<cfset objFolder.close(true)>
		<cfset objStore.close()>
	</cffunction>
		
	<cffunction name="folderDelete" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfset GetStore().getFolder(arguments.Folder).delete(true)>
		<cfreturn true>
	</cffunction>

	<cffunction name="folderCreate" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfset GetStore().getFolder(arguments.Folder).create(true)>
		<cfreturn true>
	</cffunction>

	<cffunction name="folderRename" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="renameTo" required="Yes" type="string">
		<cfset objStore = GetStore()>
		<cfset obj_Folder = OpenFolder(objStore, arguments.folder, true)>
		<cfset obj_Folder.close(true)>
		<cfset objFolder.renameTo(objStore.getFolder(arguments.renameTo))>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="count" access="public" output="No">
		<cfargument name="folder" required="No" default="Inbox" type="string">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, 0)>
		<cfset Messages = GetMessages(objFolder, "")>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn arraylen(Messages)>
	</cffunction>

	<cffunction name="list" access="public" output="No">
		<cfargument name="folder" required="No" default="Inbox" type="string">
		<cfargument name="MessageNumber" required="No" default="" type="string">
		
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, 0)>
		<cfset Messages = GetMessages(objFolder, arguments.MessageNumber)>
		<cfset Columns = "id,date,from,messagenumber,replyto,subject,cc,to,seen,answered,deleted,draft,flagged,recent,user,size">
		<cfset qry_Messages = QueryNew(Columns)>
		<cfset objMessage = "">
		<cfset from = "">
		<cfset to = "">
		<cfset flag = CreateObject("Java", "javax.mail.Flags$Flag")>
		<cfset RecipientType = CreateObject("Java", "javax.mail.Message$RecipientType")>
		<cfloop from="1" to="#arrayLen(Messages)#" step="1" index="index">
			<cfset objMessage = Messages[index]>
			<cfset From = objMessage.getFrom()>
			<cfset To = objMessage.getRecipients(RecipientType.TO)>
			<cfif not(isdefined("To"))>
				<cfset To = ArrayNew(1)>
			</cfif>
			<cfset flags = objMessage.getFlags().getSystemFlags()>
			<cfset queryAddRow(qry_Messages)>
			<cfset querySetCell(qry_Messages,"id", index)>
			<cfset querySetCell(qry_Messages,"date", objMessage.getReceivedDate())>
			<cfset querySetCell(qry_Messages,"from", arrayToList(From))>
			<cfset querySetCell(qry_Messages,"messagenumber", objMessage.getMessageNumber())>
			<cfset querySetCell(qry_Messages,"subject", objMessage.getSubject())>
			<cfset querySetCell(qry_Messages,"to", arrayToList(To))>
			<cfset querySetCell(qry_Messages,"size", objMessage.getSize())>
			<cfset querySetCell(qry_Messages,"seen", false)>
			<cfset querySetCell(qry_Messages,"answered", false)>
			<cfset querySetCell(qry_Messages,"deleted", false)>
			<cfset querySetCell(qry_Messages,"draft", false)>
			<cfset querySetCell(qry_Messages,"flagged", false)>
			<cfset querySetCell(qry_Messages,"user", false)>
			<cfset querySetCell(qry_Messages,"recent", false)>
			<cfloop from="1" to="#arrayLen(flags)#" step="1" index="i">
				<cfif flags[i] eq flag.SEEN>
					<cfset querySetCell(qry_Messages,"seen", true)>
				<cfelseif flags[i] eq flag.ANSWERED>
					<cfset querySetCell(qry_Messages,"answered", true)>
				<cfelseif flags[i] eq flag.DELETED>
					<cfset querySetCell(qry_Messages,"deleted", true)>
				<cfelseif flags[i] eq flag.DRAFT>
					<cfset querySetCell(qry_Messages,"draft", true)>
				<cfelseif flags[i] eq flag.FLAGGED>
					<cfset querySetCell(qry_Messages,"flagged", true)>
				<cfelseif flags[i] eq flag.USER>
					<cfset querySetCell(qry_Messages,"user", true)>
				<cfelseif flags[i] eq flag.RECENT>
					<cfset querySetCell(qry_Messages,"recent", true)>
				</cfif>
			</cfloop>
		</cfloop>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfquery dbtype="query" name="qry_Messages">
			select * from qry_Messages
			order by id desc
		</cfquery>
		<cfreturn qry_Messages>
	</cffunction>

	<cffunction name="view" access="public" output="Yes">
		<cfargument name="folder" required="No" default="Inbox" type="string">
		<cfargument name="MessageNumber" required="No" default="1" type="numeric">
		<cfargument name="text" required="No" default="false" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, 0)>
		<cfset Messages = GetMessages(objFolder, arguments.MessageNumber)>
		<cfset Columns = "date,from,messagenumber,replyto,subject,cc,to,body,seen,answered,deleted,draft,flagged,recent,user,attach,html">
		<cfset qry_Messages = QueryNew(Columns)>
		<cfset objMessage = "">
		<cfset from = "">
		<cfset to = "">
		<cfset flag = CreateObject("Java", "javax.mail.Flags$Flag")>
		<cfset Address = CreateObject("Java", "javax.mail.internet.InternetAddress")>
		<cfset RecipientType = CreateObject("Java", "javax.mail.Message$RecipientType")>
		<cfset part = CreateObject("Java", "javax.mail.Part")>
			<cfset objMessage = Messages[1]>
			<cfset From = objMessage.getFrom()>
			<cfset To = objMessage.getRecipients(RecipientType.TO)>
			<cfset Cc = objMessage.getRecipients(RecipientType.CC)>
			<cfset ReplyTo = objMessage.getReplyTo()>
			<cfset flags = objMessage.getFlags().getSystemFlags()>
			<cfset multipart = objMessage.getContent()>
			<cfset body = "">
			<cfset attachments = "">
			<cfset byteArray = repeatString(" ", 1000).getBytes()>
			<cftry>
			<cfset parts = arrayNew(2)>
			<cfloop from="0" to="#multipart.getCount() - 1#" index="i">
				<cfset position = arraylen(parts)>
				<cfset part = multipart.getBodyPart(javacast("int", i))>
				<cfset disposition = part.getDisposition()>
				<cfif not(isdefined("disposition"))> <!--- is javacast("null", "")> --->
					<cfset contentType = part.getContentType()>
					<cfif contentType.length() ge 10 and contentType.toLowerCase().substring(0,10) is "text/plain">
						<cfset parts[position + 1][1] = part.getContent()>
						<cfset parts[position + 1][2] = "1">
					<cfelseif contentType.length() ge 9 and contentType.toLowerCase().substring(0,9) is "text/html">
						<!--- This shouldnt happen, at least i dont think --->
						<cfset parts[position + 1][1] = part.getContent()>
						<cfset parts[position + 1][2] = "2">
					<cfelse>
						<!--- <cfdump var="other">
						<cfset parts[i + 1][1] = "Other Content Type:" & contentType.toString() & "<br>" & part.getContent()>
						<cfset parts[i + 1][2] = "3"> --->
						<cfset fo = createObject("Java", "java.io.File")>
						<cfset fso = createObject("Java", "java.io.FileOutputStream")>
						<cfset in = part.getInputStream()>
						<cfset tempFile = getTempDirectory() & Session.SessionID>
						<cfset fo.init(tempFile)>
						<cfset fso.init(fo)>
						<cfset j = in.read(byteArray)>
						<cfloop condition="not(j is -1)">
							<cfset fso.write(byteArray, 0, j)>
							<cfset j = in.read(byteArray)>
						</cfloop>
						<cfset fso.close()>

						<cffile action="READ" file="#tempFile#" variable="fileContents">
						<cffile action="DELETE" file="#tempFile#">
						<cfif findnocase("text/html", fileContents)>
							<cfset theText = right(fileContents, len(fileContents) - refindnocase("\r\n\r\n", fileContents, findnocase("text/html", fileContents)))>
							<cfif refind("--+=\S+--", theText)>
								<cfset theText = left(theText, refind("--+=\S+--", theText) -1)>
							</cfif>
							<cfset parts[position + 1][1] = theText> <!--- replace(theText, "=20#chr(13)#", "~", "ALL")> --->
							<cfset parts[position + 1][2] = "2">
						<cfelseif len(part.getFileName())>
							<cfset attachments = listappend(attachments, part.getFileName())>
						<cfelse>
							<cfset parts[position + 1][1] = fileContents>
							<cfset parts[position + 1][2] = "3">
							<!--- <cfdump var="#part.getContentType()#  name='#part.getFileName()#' #fileContents#"> --->
						</cfif>
					</cfif>
				<cfelseif disposition.equalsIgnoreCase(part.ATTACHMENT)>
					<cfset attachments = listappend(attachments, part.getFileName())>
				<cfelseif disposition.equalsIgnoreCase(part.INLINE)>
					<cfset contentType = part.getContentType()>
					<cfif contentType.length() ge 10 and contentType.toLowerCase().substring(0,10) is "text/plain">
						<cfset parts[position + 1][1] = part.getContent()>
						<cfset parts[position + 1][2] = "1">
					<cfelseif contentType.length() ge 9 and contentType.toLowerCase().substring(0,9) is "text/html">
						<!--- This shouldnt happen, at least i dont think --->
						<cfset parts[position + 1][1] = part.getContent()>
						<cfset parts[position + 1][2] = "2">
					<cfelse>
						<cfdump var="#contentType# name='#part.getFileName()#' #part.getContent()#1">
					</cfif>
				<cfelse>
					<cfset body = body & "<p>Other: " & disposition & "</p>">
				</cfif>
<!---			<cfif findnocase("text/plain", part.getContentType())>
					<cfset body = body & replace(part.getContent(), "#chr(10)#", "<BR>", "ALL") & "<P>">
				<cfelseif not(len(part.getFileName()))>
					<cfset fo = createObject("Java", "java.io.File")>
					<cfset fso = createObject("Java", "java.io.FileOutputStream")>
					<cfset in = part.getInputStream()>
					<cfset tempFile = getTempDirectory() & Session.SessionID>
					<cfset fo.init(tempFile)>
					<cfset fso.init(fo)>
					<cfset j = in.read(byteArray)>
					<cfloop condition="not(j is -1)">
						<cfset fso.write(byteArray, 0, j)>
						<cfset j = in.read(byteArray)>
					</cfloop>
					<cfset fso.close()>
					<cffile action="READ" file="#tempFile#" variable="fileContents">
					<cffile action="DELETE" file="#tempFile#">
					<cfset body = body & "<p> ****%%%%%%%%%%**** <p>"& fileContents>
				<cfelse>
					<cfset attachments = listappend(attachments, part.getFileName())>
				</cfif> --->
			</cfloop>
			<cfcatch type="Any">
					<cfset parts[1][1] = multipart>
					<cfif refindnocase("<html[0-9a-zA-Z= ""/:.]*>", multipart)>
						<cfset parts[1][2] = 2>
					<cfelse>
						<cfset parts[1][2] = 1>
					</cfif>
				</cfcatch>
			</cftry>
			<cfset isHTML = 0>
			<cfset html = 0>
			<cfloop from="1" to="#arraylen(parts)#" index="i">
				<cfif arraylen(parts) is 1>
					<cfif parts[i][2] neq 2>
						<cfset body = body & HTMLEditFormat(parts[i][1])>
						<cfset html = 0>
					<cfelse>
						<cfset body = body & parts[i][1]>
						<cfset html = 1>
					</cfif>
				<cfelse>
					<cfif isHTML or parts[i][2] is 2>
						<cfset body = body & "<p>" & parts[i][1] & "</p>">
						<cfset html = 1>
						<cfset isHTML = false>
					<cfelseif arraylen(parts) gt i>
						<cfif parts[i][2] is 1 and parts[i+1][2] is 2>
							<cfif not(arguments.text)>
								<cfset isHTML = 1>
							<cfelse>
								<cfset body = body & HTMLEditFormat(parts[i][1])>
								<cfset html = 0>
								<cfset i = i + 1>
							</cfif>
						<cfelse>
							<cfset body = body & "<p>" & HTMLEditFormat(parts[i][1]) & "</p>">
							<cfset html = 0>
						</cfif>
					<cfelse>
						<cfset body = body & "<p>" & HTMLEditFormat(parts[i][1]) & "</p>">
						<cfset html = 0>
					</cfif>
				</cfif>
			<!--- <cfif arraylen(parts) is 2>
				<cfset body = body & parts[2][1]>
			<cfelse>
				<cfloop from="1" to="#arraylen(parts)#" index="i">
					<cfset body = body & "<pre style=""white-space: -moz-pre-wrap; white-space: -pre-wrap; white-space: -o-pre-wrap; white-space: pre-wrap; word-wrap: break-word;"">" & HTMLEditFormat(parts[i]) & "</pre>">
				</cfloop>
			</cfif> --->
			</cfloop>
			<cfset queryAddRow(qry_Messages)>
			<cfset querySetCell(qry_Messages,"replyto", ReplyTo)>
			<cfset querySetCell(qry_Messages,"date", objMessage.getReceivedDate())>
			<cfset querySetCell(qry_Messages,"from", arrayToList(From))>
			<cfset querySetCell(qry_Messages,"messagenumber", objMessage.getMessageNumber())>
			<cfset querySetCell(qry_Messages,"subject", objMessage.getSubject())>
			<cfset querySetCell(qry_Messages,"to", arrayToList(To))>
			<cfif isdefined("Cc")><cfif isarray(cc)><cfset querySetCell(qry_Messages,"cc", arrayToList(Cc))><cfelse><cfset querySetCell(qry_Messages,"cc", Cc)></cfif></cfif>
			<cfset querySetCell(qry_Messages,"body", Body)>
			<cfset querySetCell(qry_Messages,"html", html)>
			<cfset querySetCell(qry_Messages,"attach", attachments)>
			<cfset querySetCell(qry_Messages,"seen", false)>
			<cfset querySetCell(qry_Messages,"answered", false)>
			<cfset querySetCell(qry_Messages,"deleted", false)>
			<cfset querySetCell(qry_Messages,"draft", false)>
			<cfset querySetCell(qry_Messages,"flagged", false)>
			<cfset querySetCell(qry_Messages,"user", false)>
			<cfset querySetCell(qry_Messages,"recent", false)>
			<cfloop from="1" to="#arrayLen(flags)#" step="1" index="i">
				<cfif flags[i] eq flag.SEEN>
					<cfset querySetCell(qry_Messages,"seen", true)>
				<cfelseif flags[i] eq flag.ANSWERED>
					<cfset querySetCell(qry_Messages,"answered", true)>
				<cfelseif flags[i] eq flag.DELETED>
					<cfset querySetCell(qry_Messages,"deleted", true)>
				<cfelseif flags[i] eq flag.DRAFT>
					<cfset querySetCell(qry_Messages,"draft", true)>
				<cfelseif flags[i] eq flag.FLAGGED>
					<cfset querySetCell(qry_Messages,"flagged", true)>
				<cfelseif flags[i] eq flag.USER>
					<cfset querySetCell(qry_Messages,"user", true)>
				<cfelseif flags[i] eq flag.RECENT>
					<cfset querySetCell(qry_Messages,"recent", true)>
				</cfif>
			</cfloop>
			<cfset objFolder.close(false)>
			<cfset objStore.close()>
		<cfreturn qry_Messages>
	</cffunction>

	<cffunction name="purge" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, true)>
		<cfset objFolder.expunge()>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="setFlag" access="private" output="No">
		<cfargument name="objFolder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="flag" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset Messages = GetMessages(arguments.objFolder, arguments.messageNumber)>
		<cfset flags = CreateObject("Java", "javax.mail.Flags$Flag")>
		<cfloop from="1" to="#arrayLen(Messages)#" step="1" index="index">
			<cfset objMessage = Messages[index]>
			<cfset objMessage.setFlag(flags[flag], value)>
		</cfloop>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="delete" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, true)>
		<cfset setFlag(objFolder, arguments.messageNumber, "DELETED", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="answered" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "ANSWERED", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="seen" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "SEEN", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="draft" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "DRAFT", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="flagged" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "FLAGGED", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="recent" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "RECENT", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>

	<cffunction name="user" access="public" output="No" returntype="boolean">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="messageNumber" required="Yes" type="string">
		<cfargument name="value" required="Yes" type="boolean">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, false)>
		<cfset setFlag(objFolder, arguments.messageNumber, "USER", arguments.value)>
		<cfset objFolder.close(false)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="send" access="public" output="No" returntype="boolean">
		<cfargument name="to" required="Yes" type="string">
		<cfargument name="cc" required="Yes" type="string">
		<cfargument name="bcc" required="Yes" type="string">
		<cfargument name="subject" required="Yes" type="string">
		<cfargument name="body" required="Yes" type="string">
		<cfargument name="attachments" required="No" type="string" default="">
		<cfset clsSession = createObject("Java", "javax.mail.Session")>
		<cfset objProperties = createObject("Java", "java.util.Properties")>
		<cfset msg = CreateObject("Java", "javax.mail.internet.MimeMessage")>
		<cfset mmp = CreateObject("Java", "javax.mail.internet.MimeMultipart")>
		<cfset mbp = CreateObject("Java", "javax.mail.internet.MimeBodyPart")>
		<cfset dhl = CreateObject("Java", "javax.activation.DataHandler")>
		<cfset fds = CreateObject("Java", "javax.activation.FileDataSource")>
		<cfset add = CreateObject("Java", "javax.mail.internet.InternetAddress")>
		<cfset trn = CreateObject("Java", "javax.mail.Transport")>
		<cfset RecipientType = CreateObject("Java", "javax.mail.Message$RecipientType")>
		<cfset Timeout = application.imapTimeout * 1000>
		<cfset objProperties.init()>
		<cfset objProperties.put("mail.store.protocol", "imap")>
		<cfset objProperties.put("mail.imap.port", application.imapPort)>
		<cfset objProperties.put("mail.imap.connectiontimeout", Timeout)>
		<cfset objProperties.put("mail.imap.timeout", Timeout)>
		<cfset objSession = clsSession.getInstance(objProperties)>
		<cfset objStore = GetStore()>
		<cfset msg.init(objSession)>
		<cfset msg.setFrom(add.init(this.username))>
		<cfset msg.addRecipients(RecipientType.TO, add.parse(replace(arguments.to, ";", ", ", "ALL"), false))>
		<cfset msg.addRecipients(RecipientType.CC, add.parse(replace(arguments.cc, ";", ", ", "ALL"), false))>
		<cfset msg.addRecipients(RecipientType.BCC, add.parse(replace(arguments.bcc, ";", ", ", "ALL"), false))>
		<cfset msg.setSubject(arguments.subject)>
		<cfset msg.setText(arguments.body)>
		<cfset msg.setHeader("X-Mailer", "Koolwired IMAP Web Client (http://www.koolwired.com)")>
		<cfset msg.setSentDate(now())>
		<cfif len(arguments.attachments)>
			<cfset mbp.init()>
			<cfset mbp.setText(arguments.body)>
			<cfset mmp.addBodyPart(mbp)>
			<cfloop list="#arguments.attachments#" index="index">
				<cfset fds.init(getTempDirectory() & index)>
				<cfset mbp.init()>
				<cfset mbp.setDataHandler(dhl.init(fds))>
				<cfset mbp.setFileName(fds.getName())>
				<cfset mmp.addBodyPart(mbp)>
			</cfloop>
			<cfset msg.setContent(mmp)>
		</cfif>
		<cfset objFolder = OpenFolder(objStore, "Inbox.Sent", true, true)>
		<cfset Messages = ArrayNew(1)>
		<cfset Messages[1] = msg>
		<cfset objFolder.appendMessages(Messages)>
		<cfset objStore.close()>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="download" access="public" output="Yes">
		<cfargument name="folder" required="Yes" type="string">
		<cfargument name="MessageNumber" required="Yes" type="numeric">
		<cfargument name="Attach" required="Yes" type="string">
		<cfset objStore = GetStore()>
		<cfset objFolder = OpenFolder(objStore, arguments.folder, 0)>
		<cfset Messages = GetMessages(objFolder, arguments.MessageNumber)>
		<cfset objMessage = "">
		<cfset attachment = StructNew()>
		<cfset byteArray = repeatString(" ", 1000).getBytes()>
		<cfset part = CreateObject("Java", "javax.mail.Part")>
			<cfset objMessage = Messages[1]>
			<cfset multipart = objMessage.getContent()>
			<cfloop from="0" to="#multipart.getCount() - 1#" index="i">
				<cfset part = multipart.getBodyPart(javacast("int", i))>
				<cfif not(findnocase("text/text", part.getContentType())) and part.getFileName() is arguments.Attach>
					<cfset StructInsert(attachment, "name", part.getFileName())>
					<cfset StructInsert(attachment, "type", part.getContentType())>
					<cfset fo = createObject("Java", "java.io.File")>
					<cfset fso = createObject("Java", "java.io.FileOutputStream")>
					<cfset in = part.getInputStream()>
					<cfset randomize(second(now()) + minute(now()) * 60)>
					<cfset tempFile = getTempDirectory() & Session.SessionID & "-" & randrange(1,100) & "-" & part.getFileName()>
					<cfset fo.init(tempFile)>
					<cfset fso.init(fo)>
					<cfset j = in.read(byteArray)>
					<cfloop condition="not(j is -1)">
						<cfset fso.write(byteArray, 0, j)>
						<cfset j = in.read(byteArray)>
					</cfloop>
					<cfset fso.close()>
					<cffile action="READBINARY" file="#tempFile#" variable="fileContents">
					<cffile action="DELETE" file="#tempFile#">
					<cfset StructInsert(attachment, "data", fileContents)>
				</cfif>
			</cfloop>
			<cfset objFolder.close(false)>
			<cfset objStore.close()>
		<cfreturn attachment>
	</cffunction>
</cfcomponent>