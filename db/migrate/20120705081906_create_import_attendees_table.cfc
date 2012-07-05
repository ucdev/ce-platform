<cfcomponent extends="plugins.dbmigrate.Migration" hint="create import_attendees table">
  <cffunction name="up">
    <cfscript>
		execute("IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[ceschema].[credit_requests]') AND name = N'ix_request_recordHash')
		DROP INDEX [ix_request_recordHash] ON [ceschema].[credit_requests] WITH ( ONLINE = OFF )");
    	t = createTable('uploads');
		t.string(columnNames="uploadtype");
		t.integer(columnNames="userId");
		t.string(columnNames="modelName",null=false);
		t.integer(columnNames="modelKey");
		t.string(columnNames="serverDirectory,serverFile,serverFileExt,serverFileName,clientDirectory,clientFile,clientFileExt,clientFileName,contentType,contentSubType",length=255,null=true);
		t.timestamps();
		t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    	dropTable("uploads");
    </cfscript>
  </cffunction>
</cfcomponent>
