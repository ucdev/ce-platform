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
		  #delete window["$"]
		  return

Inject.addRule /^bootstrap$/,
    path: "libs/bootstrap"
    pointcuts:
        before: ->
            $ = require("jquery")

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
