cfwheels + Mustache.cfc = Fumanchu
===============

[Mustache templates](http://mustache.github.com/) for Coldfusion on Wheels!

Fumanchu is a _very lightweight_ wrapper for pmcelhaney's [Mustache.cfc](https://github.com/pmcelhaney/Mustache.cfc). Its so lightweight its barely there, but it does make implementing mustache templates easier in cfwheels, even if it already _is_ pretty easy. For guaranteed satisfaction, use it with [Mustache.js](https://github.com/janl/mustache.js/).

Why?
===============

So that when you add Ajax elements to your project you only need to write the view code once! Think of mustache templates as jQuery templates that the server can use, too. Render them from within your wheels views with wheels model data and queries, or from within your (unobtrusive) javascript with JSON data. Here's an example featuring gratiuitous use of jQuery (which is not required):

#### controllers/People.cfc

    <cfcomponent extends="Controller">
      <cffunction name="init">
        <cfset provides("html,json")>
      </cffunction>
      <cffunction name="show">
        <cfset person = model("Person").findByKey(params.key)>
        <cfset renderWith(person)>
      </cffunction>
    </cfcomponent>
   
#### views/people/show.cfm

    <cfoutput>
      #javascriptIncludeTag("jquery")#
      #javaScriptIncludeTag("mustache")#
      #javaScriptIncludeTag("people")#
      <div id="person">
        <cf_mustache_template name="person_template"> 
          <h1>{{fullname}}</h1>
          <div>
            <p>{{title}}</p>
            <p>{{phone}}</p>
            <p>{{email}}</p>
          </div>
        </cf_mustache_template>
      </div>
      #renderMustache(template=person_template, data=person)#
    </cfoutput>
    
#### /javascripts/people.js

    $(document).ready(function(){
      var person_template = $('#person_template').html();
      // now you can render JSON data using the same template you defined in the view above!
      // bind something like this to any event and enjoy the mustache...
      $.getJSON("/people/show/4?format=json",function(json){
        $('#person').html(Mustache.to_html(person_template,json));
      });
    })

Installation
=======================

[Download the .zip file](https://github.com/GenuinePartsLLC/Fumanchu/zipball/master), rename it to `Fumanchu-1.0.zip` and place it in your /plugins. **You will need to add the following line to /config/app.cfm in order to use the `mustache_template` custom tag**:

`<cfset this.customTagPaths = ListAppend(this.customTagPaths,"/plugins/Fumanchu/customtags")>`