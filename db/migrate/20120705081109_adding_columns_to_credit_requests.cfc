<cfcomponent extends="plugins.dbmigrate.Migration" hint="adding columns to credit requests">
  <cffunction name="up">
    <cfscript>
		t = changeTable('credit_requests');
		t.string(columnNames="firstname,middlename,lastname,degree",length="255",null=true);
		t.timestamp(columnNames="completedate",null=true);
		t.string(columnNames="address1,address2,city,state,country",length=255,null=true);
		t.string(columnNames="zipcode",length=10,null=true);
		t.string(columnNames="phone1,phone1ext,phone2,phone2ext,fax,faxext",length=15,null=true);
		t.decimal(columnNames="hours",null=true);
		t.integer(columnNames="notifyflag",null=false,default=1);
		t.change();
    </cfscript>
  </cffunction>
  <cffunction name="down">
    <cfscript>
    	removeColumn(table="credit_requests",columnName="firstname");
		removeColumn(table="credit_requests",columnName="middlename");
		removeColumn(table="credit_requests",columnName="lastname");
		removeColumn(table="credit_requests",columnName="degree");
		removeColumn(table="credit_requests",columnName="completedate");
		removeColumn(table="credit_requests",columnName="address1");
		removeColumn(table="credit_requests",columnName="address2");
		removeColumn(table="credit_requests",columnName="city");
		removeColumn(table="credit_requests",columnName="state");
		removeColumn(table="credit_requests",columnName="country");
		removeColumn(table="credit_requests",columnName="zipcode");
		removeColumn(table="credit_requests",columnName="phone1");
		removeColumn(table="credit_requests",columnName="phone1ext");
		removeColumn(table="credit_requests",columnName="phone2");
		removeColumn(table="credit_requests",columnName="phone2ext");
		removeColumn(table="credit_requests",columnName="fax");
		removeColumn(table="credit_requests",columnName="faxext");
		removeColumn(table="credit_requests",columnName="hours");
    </cfscript>
  </cffunction>
</cfcomponent>
