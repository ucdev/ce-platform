<cfoutput>

	#errorMessagesFor("person")#

	#startFormTag(action="update", key=params.key)#
		
		<div class="group">
			#hiddenField(objectName='person', property='id')#
		</div>	
		
		<div>
			#textField(objectName='person', property='email', label='Email <em>*</em>')#
		</div>	
		
		<div>
			#submitTag()#
		</div>
		
	#endFormTag()#
	

#linkTo(text="Return to the listing", action="index")#
</cfoutput>

