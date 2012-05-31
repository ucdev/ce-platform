<cfcomponent extends="Controller">

	<cffunction name="home">
		
	</cffunction>
	
	<cffunction name="modelsetup">
		<cfquery name="tables" datasource="CCPD_DEV">
			SELECT     
			 o.name AS tblname, 
			 o.type, 
			 c.name AS colName, 
			 s.name AS colType, 
			 c.prec, 
			 c.scale, 
			 c.*
			FROM        
			 dbo.sysobjects AS o 
			INNER JOIN
			 dbo.syscolumns AS c 
			  ON 
			   c.id = o.id 
			INNER JOIN
			 dbo.systypes AS s 
			  ON 
			   c.xtype = s.xtype
			WHERE  (
			   o.type = 'U'
			   AND c.colorder = 1
			   AND o.name LIKE 'ce_%'
			   AND c.name LIKE '%ID%'
			)
			ORDER BY o.name
		</cfquery>
		<cffile action="read" file="#expandPath('/models/template.txt')#" variable="tmpl" charset="UTF-8"> 
		
		<cfloop query="tables">
			<cfset filename = replace(tables.tblname,'ce_','') />
			<cfset filename = lcase(replace(filename,'_','','ALL')) />
			<cfset filename = filename & ".cfc" />
			
			<cfset fileOutput = replace(tmpl,'%primarykey%',tables.colName,'All') />
			<cfset fileOutput = replace(fileOutput,'%tablename%',tables.tblname,'ALL') />
			
			<cffile action="write" addnewline="yes" file="#expandPath('/models/')##filename#" charset="UTF-8" nameconflict="overwrite" output="#fileOutput#" fixnewline="no">
		</cfloop>
	</cffunction>
</cfcomponent>



