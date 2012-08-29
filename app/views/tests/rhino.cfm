<!--- Get the script manager class. --->
    <cfset scriptManager = createObject(
    "java",
    "javax.script.ScriptEngineManager"
    ) />
     
    <!--- Get the factories that are natively available. --->
    <cfset scriptFactories = scriptManager.getEngineFactories() />
     
    <!---
    Loop over the factories and output the names that each
    can build.
    --->
    <cfloop
    index="scriptFactory"
    array="#scriptFactories#">
     
    <!--- Output factory name and version. --->
    <cfoutput>
    [
    #scriptFactory.getEngineName()# -
    #scriptFactory.getEngineVersion()#
    ]
     
    <br />
     
    <!---
    Output the names that this factory will respond to
    (the names for which it can create valid script
    engines).
    --->
    <cfloop
    index="alias"
    array="#scriptFactory.getNames()#">
     
    - #alias#<br />
     
    </cfloop>
     
    </cfoutput>
     
    </cfloop>