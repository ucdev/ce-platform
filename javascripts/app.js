window.CE = window.CE || {};

CE = new Backbone.Marionette.Application();

CE.bind("initialize:before", function(options){
	
});

CE.bind("initialize:after", function(options){
	if (Backbone.history){
		
	}
});

CE.addInitializer(function(options) {
	CE.addRegions(mainRegion='#app');
	debug.info("init: app");
});

$(document).ready(function() {
	//CE.start();
});