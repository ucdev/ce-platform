<h1>Showing person_user</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_user.id#</p>
				
					<p><span>Displayname</span> <br />
						#person_user.displayname#</p>
				
					<p><span>Primary_email_id</span> <br />
						#person_user.primary_email_id#</p>
				
					<p><span>Primary_image_id</span> <br />
						#person_user.primary_image_id#</p>
				
					<p><span>Primary_entity_id</span> <br />
						#person_user.primary_entity_id#</p>
				
					<p><span>Password</span> <br />
						#person_user.password#</p>
				
					<p><span>Last_login</span> <br />
						#person_user.last_login#</p>
				
					<p><span>Last_login_ip</span> <br />
						#person_user.last_login_ip#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_user", action="edit", key=person_user.id)#
</cfoutput>
