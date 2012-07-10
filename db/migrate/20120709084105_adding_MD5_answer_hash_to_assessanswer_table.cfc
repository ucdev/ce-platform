<cfcomponent extends="plugins.dbmigrate.Migration" hint="adding MD5 answer hash to assessanswer table">
  <cffunction name="up">
    <cfscript>
    t = changeTable('ce_assessAnswer');
    t.string(columnNames="md5checksum");
    t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    removeColumn(table='ce_assessAnswer',columnName='md5checksum');
    </cfscript>
  </cffunction>
</cfcomponent>
