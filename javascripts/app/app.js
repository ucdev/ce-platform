window.ce = window.ce || {};
ce = new Backbone.Marionette.Application();

ce.module("activity");
ce.module("person");

ce.bind("initialize:before", function(options){
	
});

ce.addRegions({
  page: "#page",
  subpage: ".contentBar div.content-container"
});

ce.bind("initialize:after", function(options){

});

ce.addInitializer(function(options) {
	ce.log.info("init: app");
});

$(document).ready(function() {
	//ce.start();
});