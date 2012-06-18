<cfcomponent extends="plugins.dbmigrate.Migration" hint="Add geonameid to ce_attendee table">
  <cffunction name="up">
    <cfscript>
	addColumn(table='ce_attendee',columnType='integer',columnName='geonameid');
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='ce_attendee',columnName='geonameid');
    </cfscript>
  </cffunction>
</cfcomponent>
