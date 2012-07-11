window.CE = window.CE || {};

CE = new Backbone.Marionette.Application();

CE.module("tier1")

CE.bind("initialize:before", function(options){
	
});

var ModalRegion = Backbone.Marionette.Region.extend({
  el: "#modal",

  constructor: function(){
    _.bindAll(this);
    Backbone.Marionette.Region.prototype.constructor.apply(this, arguments);
    this.on("view:show", this.showModal, this);
  },

  getEl: function(selector){
    var $el = $(selector);
    $el.on("hidden", this.close);
    return $el;
  },

  showModal: function(view){
    view.on("close", this.hideModal, this);
    this.$el.modal('show');
  },

  hideModal: function(){
    this.$el.modal('hide');
  }
});

CE.addRegions({
  content: "#content",
  modal: ModalRegion
});

CE.bind("initialize:after", function(options){
	if (Backbone.history){
		
	}
});


/*Backbone.Marionette.TemplateCache.prototype.loadTemplate = function(templateId){
  // load your template here, returning a compiled template or function
  // that returns the rendered HTML
  var myTemplate = compileMyTemplate("some template");

  // send the template back
  return myTemplate;
}*/

CE.addInitializer(function(options) {
	debug.info("init: app");
});

$(document).ready(function() {
	CE.start();
});