###!=================================================
*  Foundry v0.1
*  (c) 2012 Joshua F. Rountree, Justin Slamka, University of Cincinnati
*  =================================================
*  Foundry may be freely distributed under the MIT license.
*  For all details and documentation:
*  https://github.com/JoshuaIRL/foundry.coffee 
*  =================================================###
((root, factory) ->
  # Set up Foundry appropriately for the environment.
  if typeof exports isnt "undefined"
    # Node/CommonJS, no need for jQuery in that case.
    factory root, exports, require("backbone")
  else if typeof define is "function" and define.amd
    # AMD
    define ["backbone", "jquery", "exports"], (Backbone, $, exports) ->
      # Export global even in AMD case in case this script is loaded with
      # others that may still expect a global Foundry.
      root.Foundry = factory(root, exports, Backbone, $)
  else
    # Browser globals
    root.Foundry = factory(root, {}, root.Backbone, (root.jQuery or root.Zepto or root.ender))
) this, (root, Foundry, Backbone, $) ->
	Module = Foundry.Module = {}
	Widget = Foundry.Widget = {}
	# When copying properties, skip over the following:
	SKIP_PROPERTIES = [
	  "constructor"
	  "extended"
	  "included"
	  "prototype"
	]

	# Adds each property from the mixin to the given object.
	__extend = (object, mixin) ->
	  for own name, method of mixin when name not in SKIP_PROPERTIES
	    object[name] = method
	    
	# Adds the instance methods from each given mixin
	# as class methods.
	extend = (object, mixins...) ->
	  for mixin in mixins
	    __extend object, mixin:: ? mixin
	    mixin.extended object if mixin.extended?
	    
	# Adds the instance and class methods from each
	# given mixin.
	include = (object, mixins...) ->
	  throw new TypeError unless object::?
	  for mixin in mixins
	    if mixin::?
	      __extend object, mixin
	      __extend object::, mixin::
	    else
	      __extend object::, mixin
	    mixin.included object if mixin.included?

	###
	* Base class for adding mixins, Ruby style, to CoffeeScript
	* classes. There is no support for super. This essentially
	* just copies over properties from objects and classes.
	* 
	###
	class Module extends Backbone.View
	  ###
	  * Calls extends method, with `this` as the object.
	  * Not to be confused with "extend" which is the way you extend an Object in Backbone
	  * This is the only instance of misleading functions / symantecs within Foundry
	  ###
	  @extends: (mixins...) ->
	    extend @, mixins...

	  # Calls includes method, with `this` as the object.
	  @includes: (mixins...) ->
	    include @, mixins...

	class Widget extends Module
  		
	Foundry