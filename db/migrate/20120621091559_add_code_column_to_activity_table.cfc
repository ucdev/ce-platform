<cfcomponent extends="plugins.dbmigrate.Migration" hint="add code column to activity table">
  <cffunction name="up">
    <cfscript>
    t = changeTable('ce_activity');
    t.string(columnNames="code",limit=15)
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='ce_activity',columnName='code');
    </cfscript>
  </cffunction>
</cfcomponent>
