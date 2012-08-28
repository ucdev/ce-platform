###=================================================
*  Foundry v0.1
*  (c) 2012 Joshua F. Rountree, Justin Slamka, University of Cincinnati
*  =================================================
*  Foundry may be freely distributed under the MIT license.
*  For all details and documentation:
*  https://github.com/JoshuaIRL/foundry.coffee 
*  =================================================###

Backbone = require("backbone")
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
class Component extends Backbone.View
  # Calls includes method, with `this` as the object.
  @include: (mixins...) ->
    include @, mixins...

module.setExports(Component)
