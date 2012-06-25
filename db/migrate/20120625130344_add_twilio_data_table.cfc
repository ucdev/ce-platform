<cfcomponent extends="plugins.dbmigrate.Migration" hint="add twilio data table">
  <cffunction name="up">
    <cfscript>
    t = createTable('twilio_log');
	t.string(columnNames="type");
	t.text(columnNames="data");
    t.timestamps();
    t.create();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    dropTable('twilio_log');
    </cfscript>
  </cffunction>
</cfcomponent>
