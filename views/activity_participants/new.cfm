<h1>Create a New attendee</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
			
			#errorMessagesFor("attendee")#
	
			#startFormTag(action="create")#
		
				
					
						#textField(objectName='attendee', property='AttendeeID', label='Attendee ID')#
																
				
					
						#textField(objectName='attendee', property='ActivityID', label='Activity ID')#
																
				
					
						#textField(objectName='attendee', property='PersonID', label='Person ID')#
																
				
					
						#textField(objectName='attendee', property='StatusID', label='Status ID')#
																
				
					
						#textField(objectName='attendee', property='CheckedInFlag', label='Checked In Flag')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='CheckIn', dateOrder='year,month,day', monthDisplay='abbreviations', label='Check In')#
																
				
					
						#textField(objectName='attendee', property='CheckedOutFlag', label='Checked Out Flag')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='CheckOut', dateOrder='year,month,day', monthDisplay='abbreviations', label='Check Out')#
																
				
					
						#textField(objectName='attendee', property='MDflag', label='M Dflag')#
																
				
					
						#textField(objectName='attendee', property='TermsFlag', label='Terms Flag')#
																
				
					
						#textField(objectName='attendee', property='PaymentFlag', label='Payment Flag')#
																
				
					
						#textField(objectName='attendee', property='PayAmount', label='Pay Amount')#
																
				
					
						#textField(objectName='attendee', property='PayOrderNo', label='Pay Order No')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='PaymentDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Payment Date')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='RegisterDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Register Date')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='CompleteDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Complete Date')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='TermDate', dateOrder='year,month,day', monthDisplay='abbreviations', label='Term Date')#
																
				
					
						#textField(objectName='attendee', property='firstName', label='First Name')#
																
				
					
						#textField(objectName='attendee', property='middleName', label='Middle Name')#
																
				
					
						#textField(objectName='attendee', property='lastName', label='Last Name')#
																
				
					
						#textField(objectName='attendee', property='email', label='Email')#
																
				
					
						#textField(objectName='attendee', property='certName', label='Cert Name')#
																
				
					
						#textField(objectName='attendee', property='address1', label='Address1')#
																
				
					
						#textField(objectName='attendee', property='address2', label='Address2')#
																
				
					
						#textField(objectName='attendee', property='city', label='City')#
																
				
					
						#textField(objectName='attendee', property='stateProvince', label='State Province')#
																
				
					
						#textField(objectName='attendee', property='stateId', label='State Id')#
																
				
					
						#textField(objectName='attendee', property='countryId', label='Country Id')#
																
				
					
						#textField(objectName='attendee', property='postalCode', label='Postal Code')#
																
				
					
						#textField(objectName='attendee', property='phone1', label='Phone1')#
																
				
					
						#textField(objectName='attendee', property='phone1ext', label='Phone1ext')#
																
				
					
						#textField(objectName='attendee', property='phone2', label='Phone2')#
																
				
					
						#textField(objectName='attendee', property='phone2ext', label='Phone2ext')#
																
				
					
						#textField(objectName='attendee', property='fax', label='Fax')#
																
				
					
						#textField(objectName='attendee', property='faxext', label='Faxext')#
																
				
					
						#textField(objectName='attendee', property='entryMethod', label='Entry Method')#
																
				
					
						#checkBox(objectName='attendee', property='emailSentFlag', label='Email Sent Flag')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='Created', dateOrder='year,month,day', monthDisplay='abbreviations', label='Created')#
																
				
					
						#textField(objectName='attendee', property='CreatedBy', label='Created By')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='Updated', dateOrder='year,month,day', monthDisplay='abbreviations', label='Updated')#
																
				
					
						#textField(objectName='attendee', property='UpdatedBy', label='Updated By')#
																
				
					
						#dateTimeSelect(objectName='attendee', property='Deleted', dateOrder='year,month,day', monthDisplay='abbreviations', label='Deleted')#
																
				
					
						#textField(objectName='attendee', property='DeletedFlag', label='Deleted Flag')#
																
				

				#submitTag()#
				
			#endFormTag()#
			
		

#linkTo(text="Return to the listing", action="index")#
</cfoutput>
