

/***  app/assets/javascripts/application  ***/

/*! -------------------------
	CE Platform v3.0.2
	Copyright 2012 University of Cincinnati
	Authors: J.F. Rountree, J.S. Slamka, Staff of Continuing Medical Education
	-------------------------
*/
;


/***  app/assets/javascripts/foundry/init  ***/

var root;

root = typeof exports !== "undefined" && exports !== null ? exports : this;

root.Foundry = {};


/***  app/assets/javascripts/foundry/component  ***/

var SKIP_PROPERTIES, include, __extend,
  __hasProp = {}.hasOwnProperty,
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
  __slice = [].slice,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

SKIP_PROPERTIES = ["constructor", "extended", "included", "prototype"];

__extend = function(object, mixin) {
  var method, name, _results;
  _results = [];
  for (name in mixin) {
    if (!__hasProp.call(mixin, name)) continue;
    method = mixin[name];
    if (__indexOf.call(SKIP_PROPERTIES, name) < 0) {
      _results.push(object[name] = method);
    }
  }
  return _results;
};

include = function() {
  var mixin, mixins, object, _i, _len, _results;
  object = arguments[0], mixins = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
  if (object.prototype == null) {
    throw new TypeError;
  }
  _results = [];
  for (_i = 0, _len = mixins.length; _i < _len; _i++) {
    mixin = mixins[_i];
    if (mixin.prototype != null) {
      __extend(object, mixin);
      __extend(object.prototype, mixin.prototype);
    } else {
      __extend(object.prototype, mixin);
    }
    if (mixin.included != null) {
      _results.push(mixin.included(object));
    } else {
      _results.push(void 0);
    }
  }
  return _results;
};

/*
* Base class for adding mixins, Ruby style, to CoffeeScript
* classes. There is no support for super. This essentially
* just copies over properties from objects and classes.
*
*/


Foundry.Component = (function(_super) {

  __extends(Component, _super);

  function Component() {
    return Component.__super__.constructor.apply(this, arguments);
  }

  Component.include = function() {
    var mixins;
    mixins = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    return include.apply(null, [this].concat(__slice.call(mixins)));
  };

  return Component;

})(Backbone.View);


/***  app/assets/javascripts/foundry/widget  ***/

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Foundry.Widget = (function(_super) {

  __extends(Widget, _super);

  function Widget() {
    return Widget.__super__.constructor.apply(this, arguments);
  }

  return Widget;

})(Foundry.Component);


/***  app/assets/javascripts/foundry/app  ***/

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Foundry.App = (function(_super) {

  __extends(App, _super);

  function App() {
    this.$win = window;
    this.$doc = this.$win.document;
    this.$body = this.$doc.body;
    this.el = $("#app");
  }

  return App;

})(Foundry.Component);


/***  app/assets/javascripts/foundry/index  ***/

/*








*/
;
