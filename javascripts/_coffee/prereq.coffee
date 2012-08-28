Inject.reset();
#Inject.enableDebug("logging");
Inject.setModuleRoot "/javascripts/"

# window.onerror = (message) ->
#   err = document.createElement "p";
#   err.innerHTML = message.replace("\n", "<br>");
#   output = document.getElementById 'error-output'
#   output.appendChild err
#   output.style.display = 'block'
#   return true

Inject.addRule /^jquery$/,
	path: "libs/jquery",
	pointcuts:
		after: ->
            module.setExports(jQuery.noConflict())
            #console.log "jquery loaded"

            delete window["$"]
            delete window["jQuery"]
            return

Inject.addRule /^bootstrap$/,
    path: "libs/bootstrap"
    pointcuts:
        before: ->
            $ = require("jquery")

Inject.addRule /^logger$/,
    path: "libs/debug"
    pointcuts:
        after: ->
            module.setExports(window.debug)


Inject.addRule /app\/models\//, 
    path: (module) ->
        return module.replace("app/models","app/base/models")


Inject.addRule /^app\/collections\//, 
    path: (module) ->
        return module.replace("app/collections","app/base/collections")

Inject.addRule /^underscore$/, 
    path: "libs/underscore"

Inject.addRule /^backbone$/,
    path: "libs/backbone"

Inject.addRule /^backbone.paginator$/,
    path: "libs/backbone/backbone.paginator"


delete window["Class"]