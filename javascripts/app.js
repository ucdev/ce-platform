window.CE = window.CE || {};

CE = new Backbone.Marionette.Application();

CE.module("Models");
CE.module("Collections");
CE.module("Views");
CE.module("Controllers");
CE.module("Routers");

CE.bind("initialize:before", function(options){
	options.moreData = "Yo dawg, I heard you like options so I put some options in your options!"
});

CE.bind("initialize:after", function(options){
	if (Backbone.history){
		Backbone.history.start();
	}
});

CE.addInitializer(function(options) {
	CE.addRegions(mainRegion='#app');
});