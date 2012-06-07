<h1>Editing person_address</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			#errorMessagesFor("person_address")#
	
			#startFormTag(action="update", key=params.key)#
		
				
					
						#textField(objectName='person_address', property='AddressID', label='Address ID')#
															
				
					
						#textField(objectName='person_address', property='PersonID', label='Person ID')#
															
				
					
						#textField(objectName='person_address', property='AddressTypeID', label='Address Type ID')#
															
				
					
						#textField(objectName='person_address', property='Address1', label='Address1')#
															
				
					
						#textField(objectName='person_address', property='Address2', label='Address2')#
															
				
					
						#textField(objectName='person_address', property='City', label='City')#
															
				
					
						#textField(objectName='person_address', property='State', label='State')#
															
				
					
						#textField(objectName='person_address', property='stateId', label='State Id')#
															
				
					
						#textField(objectName='person_address', property='Province', label='Province')#
															
				
					
						#textField(objectName='person_address', property='Country', label='Country')#
															
				
					
						#textField(objectName='person_address', property='countryId', label='Country Id')#
															
				
					
						#textField(objectName='person_address', property='ZipCode', label='Zip Code')#
															
				
					
						#textField(objectName='person_address', property='Phone1', label='Phone1')#
															
				
					
						#textField(objectName='person_address', property='Phone1Ext', label='Phone1 Ext')#
															
				
					
						#textField(objectName='person_address', property='Phone2', label='Phone2')#
															
				
					
						#textField(objectName='person_address', property='Phone2Ext', label='Phone2 Ext')#
															
				
					
						#textField(objectName='person_address', property='Phone3', label='Phone3')#
															
				
					
						#textField(objectName='person_address', property='Phone3Ext', label='Phone3 Ext')#
															
				
					
						#textField(objectName='person_address', property='geonameid', label='Geonameid')#
															
				
					
						#dateTimeSelect(objectName='person_address', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
															
				
					
						#textField(objectName='person_address', property='CreatedBy', label='Created By')#
															
				
					
						#dateTimeSelect(objectName='person_address', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
															
				
					
						#textField(objectName='person_address', property='UpdatedBy', label='Updated By')#
															
				
				
				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
