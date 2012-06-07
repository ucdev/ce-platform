<h1>Showing cert_credit</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#cert_credit.id#</p>
				
					<p><span>Cert Id</span> <br />
						#cert_credit.certId#</p>
				
					<p><span>Credit Id</span> <br />
						#cert_credit.creditId#</p>
				
					<p><span>Created</span> <br />
						#cert_credit.created#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this cert_credit", action="edit", key=cert_credit.id)#
</cfoutput>
