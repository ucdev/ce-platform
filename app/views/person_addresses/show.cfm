<h1>Showing person_address</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#person_address.id#</p>
				
					<p><span>Person ID</span> <br />
						#person_address.PersonID#</p>
				
					<p><span>Address Type ID</span> <br />
						#person_address.AddressTypeID#</p>
				
					<p><span>Address1</span> <br />
						#person_address.Address1#</p>
				
					<p><span>Address2</span> <br />
						#person_address.Address2#</p>
				
					<p><span>City</span> <br />
						#person_address.City#</p>
				
					<p><span>State</span> <br />
						#person_address.State#</p>
				
					<p><span>State Id</span> <br />
						#person_address.stateId#</p>
				
					<p><span>Province</span> <br />
						#person_address.Province#</p>
				
					<p><span>Country</span> <br />
						#person_address.Country#</p>
				
					<p><span>Country Id</span> <br />
						#person_address.countryId#</p>
				
					<p><span>Zip Code</span> <br />
						#person_address.ZipCode#</p>
				
					<p><span>Phone1</span> <br />
						#person_address.Phone1#</p>
				
					<p><span>Phone1 Ext</span> <br />
						#person_address.Phone1Ext#</p>
				
					<p><span>Phone2</span> <br />
						#person_address.Phone2#</p>
				
					<p><span>Phone2 Ext</span> <br />
						#person_address.Phone2Ext#</p>
				
					<p><span>Phone3</span> <br />
						#person_address.Phone3#</p>
				
					<p><span>Phone3 Ext</span> <br />
						#person_address.Phone3Ext#</p>
				
					<p><span>Geonameid</span> <br />
						#person_address.geonameid#</p>
				
					<p><span>Created</span> <br />
						#person_address.Created#</p>
				
					<p><span>Created By</span> <br />
						#person_address.CreatedBy#</p>
				
					<p><span>Updated</span> <br />
						#person_address.Updated#</p>
				
					<p><span>Updated By</span> <br />
						#person_address.UpdatedBy#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person_address", action="edit", key=person_address.id)#
</cfoutput>
