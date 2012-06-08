<h1>Create a New file</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("file")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='file', property='fileID', label='File ID')#
																
				
					
						#textField(objectName='file', property='ActivityID', label='Activity ID')#
											
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
