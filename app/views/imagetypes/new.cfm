<h1>Create a New imagetype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("imagetype")#
	
			#startFormTag(action="create")#
		
				
																
				
					
						#textField(objectName='imagetype', property='name', label='Name')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
