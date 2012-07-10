window.CE = window.CE || {};

CE = new Backbone.Marionette.Application();

CE.bind("initialize:before", function(options){
	debug.info("initialize:before");
});

CE.bind("initialize:after", function(options){
	if (Backbone.history){
		Backbone.history.start();
	}
	debug.info("initialize:after");
});

CE.addInitializer(function(options) {
	CE.addRegions(mainRegion='#app');
	debug.info("initializing");
});