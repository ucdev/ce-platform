<cfcomponent extends="plugins.dbmigrate.Migration" hint="Create Users Table">

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="up">
	<cfscript>
		t = createTable('users');
		t.string(columnNames='username', 			limit=20);
		t.string(columnNames='password', 			limit=255);
		t.string(columnNames='email', 				limit=100);
		t.string(columnNames='firstname,lastname', 	limit=50);
		t.string(columnNames='activationCode', 		limit=35);
		t.timestamp(columnNames='lastLogin,activatedAt,createdAt,updated');
		t.create();
	</cfscript>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

	<cffunction name="down">
	<cfscript>
		dropTable('users');
	</cfscript>
	</cffunction>

	<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->

</cfcomponent>
