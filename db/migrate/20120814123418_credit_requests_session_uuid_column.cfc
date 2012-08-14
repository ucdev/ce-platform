<cfcomponent extends="plugins.dbmigrate.Migration" hint="credit_requests session uuid column">
  <cffunction name="up">
    <cfscript>
    t = changeTable('credit_requests');
    t.string(columnNames="sessionid",null=true,default="")
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='credit_requests',columnName='sessionid');
    </cfscript>
  </cffunction>
</cfcomponent>
