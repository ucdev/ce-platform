<h1>Create a New sys_degree</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("sys_degree")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='sys_degree', property='DegreeID', label='Degree ID')#
																
				
					
						#textField(objectName='sys_degree', property='Name', label='Name')#
																
				
					
						#textField(objectName='sys_degree', property='Abbrev', label='Abbrev')#
																
				
					
						#textField(objectName='sys_degree', property='Sort', label='Sort')#
																
				
					
						#textField(objectName='sys_degree', property='Profession', label='Profession')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
