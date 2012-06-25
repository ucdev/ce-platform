<cfcomponent extends="plugins.dbmigrate.Migration" hint="credit_request table">
  <cffunction name="up">
    <cfscript>
	t = createTable('credit_requests');
	t.string(columnNames="type");
	t.integer(columnNames="activityId",null=false);
	t.integer(columnNames="personId,attendeeId",null=true);
	t.string(columnNames="name",length="255",null=false);
	t.string(columnNames="phone",length="11",null=true);
	t.string(columnNames="email",length="255",null=true);
	t.string(columnNames="code",length="25",null=true);
	t.string(columnNames="recordHash",length="32",null=false);
	
	t.timestamps();
	t.create();
	
	addIndex(table="credit_requests",columnNames="recordHash",unique=true,indexName="ix_request_recordHash");
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('credit_requests');
    </cfscript>
  </cffunction>
</cfcomponent>
