<!--- Import the CFGroovy tag library. --->
    <cfimport prefix="g" taglib="../cfgroovy/" />
     
    <!--- Execute Javascript (on the Server). --->
    <g:script lang="JavaScript">
     
    <!---
    Create the super constructor for the Person class.
    This will create an object with private variables
    and getters / setters.
     
    Not only will this test for object functionality, it will
    test to make sure the concept of lexically-bound variables
    remains true even inside the ColdFusion context.
    --->
    function Person( name ){
    var _name = name;
     
    return({
    getName: function(){
    return( _name );
    },
     
    setName: function( name ){
    _name = name
    return( this );
    }
    });
    };
     
     
    <!--- Create a new person. --->
    var katie = Person( "Katie" );
     
     
    <!---
    Store a message value into the ColdFusion Variables
    scope; this value is just a simple string.
    --->
    variables.put( "message", (katie.getName() + " is hot!") );
     
    <!---
    Store the new Person instance back into ColdFusion.
    For this, we need to use the Java-native methods
    calls for the Variable scope's hash table.
    --->
    variables.put( "katie", katie );
     
    </g:script>
     
     
    <!---
    Output the message we stored. Since the original value is
    a simple string, it has been automatically converted into
    a Java string that we can use as-is.
    --->
    <cfoutput>
    Message: #message#<br />
    </cfoutput>
     
     
    <!---
    Now, that "katie" object is stored in the variables scope,
    let's get the Name property. Unfortunately, the Java
    representation of a JavaScript object is not exactly as it
    is in Javascript - it's a simulation. As such, we need to
    fenagle a bit to use the object in the ColdFusion context.
    --->
    <cfset name = katie.callMethod( katie, "getName", arrayNew( 1 ) ) />
     
    <cfoutput>
    Name: #name#<br />
    </cfoutput>