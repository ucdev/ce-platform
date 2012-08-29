<cfcomponent extends="Model">
    <cffunction name="init">
        <cfset table("ce_Activity_Faculty")>
        <cfset property(name="id", column="FacultyID") />
        <!---<cfset setPrimaryKey(property="id") />--->
        
        <cfset belongsTo(name="person")>
        <cfset belongsTo(name="cv", modelName="file", foreignKey="CVFileID")>
        <cfset belongsTo(name="disclosure", modelName="file", foreignKey="disclosureFileId")>
    </cffunction>
</cfcomponent>
