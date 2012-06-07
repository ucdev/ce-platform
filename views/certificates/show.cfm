<h1>Showing certificate</h1>

<cfoutput>#includePartial("showFlash")#</cfoutput>

<cfoutput>

			
				
					<p><span>Id</span> <br />
						#certificate.id#</p>
				
					<p><span>Title</span> <br />
						#certificate.title#</p>
				
					<p><span>Detail</span> <br />
						#certificate.detail#</p>
				
					<p><span>Cert Config File</span> <br />
						#certificate.certConfigFile#</p>
				
			
		

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this certificate", action="edit", key=certificate.id)#
</cfoutput>
