Inject.reset();
#Inject.enableDebug("logging");
Inject.setModuleRoot "/javascripts/"

# window.onerror = (message) ->
#   err = document.createElement("p");
#   err.innerHTML = message.replace("\n", "<br>");
#   output = document.getElementById('error-output')
#   output.appendChild(err)
#   output.style.display = 'block';
#   return true;

Inject.addRule /^jquery$/,
	path: "vendor/jquery/jquery",
	pointcuts:
		after: ->
		  module.setExports(jQuery.noConflict())
		  #delete window["$"]
		  return
  

Inject.addRule /^underscore$/, 
  path: "vendor/underscore/underscore"

Inject.addRule /^backbone$/,
  path: "vendor/backbone/backbone",

Inject.addRule /^backbone.paginator$/,
	path: "vendor/backbone/backbone.paginator"

