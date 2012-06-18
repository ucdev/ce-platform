<cfcomponent extends="plugins.dbmigrate.Migration" hint="Add geonameid to ce_attendee table">
  <cffunction name="up">
    <cfscript>
	addColumn(table='ce_activity',columnType='integer',columnName='geonameid');
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='ce_activity',columnName='geonameid');
    </cfscript>
  </cffunction>
</cfcomponent>
