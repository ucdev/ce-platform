<h1>Editing imagetype</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("imagetype")#
	
			#startFormTag(action="update", key=params.key)#
		
				
															
				
					
						#textField(objectName='imagetype', property='name', label='Name')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
