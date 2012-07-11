window.CE = window.CE || {};

CE = new Backbone.Marionette.Application();

CE.module("tier1");
CE.module("tier2");
CE.module("tier3");

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
	CE.start();
});