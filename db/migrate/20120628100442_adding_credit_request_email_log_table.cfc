<cfcomponent extends="plugins.dbmigrate.Migration" hint="adding credit_request_email log table">
  <cffunction name="up">
    <cfscript>
    t = createTable('credit_request_emails');
	t.integer(columnNames="emailId");
	t.timestamp(columnNames="emailDate");
	t.string(columnNames="emailFrom",length=255,null=false);
	t.integer(columnNames="messagenumber");
	t.string(columnNames="emailReplyto",length=255);
	t.string(columnNames="emailSubject",length=255);
	t.string(columnNames="emailTo",length=255);
	t.integer(columnNames="emailSize");
	t.integer(columnNames="isProcessed");
	
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('credit_request_emails');
    </cfscript>
  </cffunction>
</cfcomponent>
