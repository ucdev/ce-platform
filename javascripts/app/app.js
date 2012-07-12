window.ce = window.ce || {};
ce = new Backbone.Marionette.Application();

ce.module("activity");
ce.module("person");

ce.bind("initialize:before", function(options){
	
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

ce.bind("initialize:after", function(options){

});

ce.addInitializer(function(options) {
	debug.info("init: app");
});

$(document).ready(function() {
	//ce.start();
});