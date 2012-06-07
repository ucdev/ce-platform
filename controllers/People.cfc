<cfcomponent extends="Controller">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="index">
		<cfset People = model("Person").findAll(maxRows=100)>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="show">

		<cfset Person = model("Person").findByKey(params.key)>

		<!--- Check if the record exists --->
		<cfif NOT IsObject(Person)>
			<cfset flashInsert(info="Person #params.key# was not found")>

			<cftry>
				<cfset redirectTo(back=true)>

			<cfcatch type="Wheels.RedirectBackError">
				<cfset redirectTo(action="index")>
			</cfcatch>
			</cftry>
		</cfif>
		
		<cfset subLayout('show') />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="new">

		<cfset Person = model("Person").new()>

	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="edit">

		<cfset Person = model("Person").findByKey(params.key)>

		<!--- Check if the record exists --->
		<cfif NOT IsObject(Person)>
		<cfset flashInsert(info="Person #params.key# was not found")>

		<cftry>
		<cfset redirectTo(back=true)>

		<cfcatch type="Wheels.RedirectBackError">
		<cfset redirectTo(action="index")>
		</cfcatch>
		</cftry>
		</cfif>
		
		<cfset subLayout('edit') />
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="create">
		<cfset Person = model("Person").new(params.Person)>

		<!---
		TODO  remove the auto population of params here for security reasons
		--->

		<!--- Verify that the Person creates successfully --->
		<cfif Person.save()>
		<!---
			TODO would like to move this method somewhere else, but sendEmail is only available to the controller i believe
			--->
			<cfset sendEmail(to=Person.email, from="#request.signup_from_email_address#", subject="Online account activation", template="email_template_new_Person_activation", Person=Person) />

			<cfset flashInsert(success="Thanks for signing up! You cannot login yet however. We have sent you an email with a link to verify your email address.")>
			<cfset redirectTo(route="login")>
		<cfelse>
			<cfset flashInsert(error="There was an error creating the Person.")>
			<cfset renderPage(action="new")>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="update">
		<cfset Person = model("Person").findByKey(params.key)>

		<!--- Verify that the Person updates successfully --->
		<cfif Person.update(params.Person)>
			<cfset flashInsert(success="The Person was updated successfully.")>	
			<cfset redirectTo(action="show", key=Person.id)>
		<cfelse>
			<cfset flashInsert(error="There was an error updating the Person.")>
			<cfset renderPage(action="edit")>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="delete">
		<cfset Person = model("Person").findByKey(params.key)>

		<!--- Verify that the Person deletes successfully --->
		<cfif Person.delete()>
			<cfset flashInsert(success="The Person was deleted successfully.")>	
			<cfset redirectTo(action="index")>
		<cfelse>
			<cfset flashInsert(error="There was an error deleting the Person.")>
			<cfset redirectTo(action="index")>
		</cfif>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
	
	<cffunction name="register">
		<cfset Person = model("Person").new()>
    </cffunction>
	
	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
</cfcomponent>
