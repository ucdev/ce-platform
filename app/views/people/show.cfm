<h1>Showing person</h1>

<cfoutput>
<p><label>Id</label> <br />
#person.id#</p>

<p><label>First Name</label> <br />
#person.firstname#</p>

<p><label>Email</label> <br />
#person.email#</p>

<p><label>Password</label> <br />
#person.password#</p>

#linkTo(text="Return to the listing", action="index")# | #linkTo(text="Edit this person", action="edit", key=person.id)#
</cfoutput>

