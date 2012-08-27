/*! app/collections/agendas
* 	@requires: app,app/collection,app/models/agenda
* 	@extends: app.Collection
* 	@exports: app.collections.Agendas
*/
define("app/collections/agendas",["require"],function(require) {
	var AppCollection = require("app/collection");
	var AgendaModel = require("app/models/agenda");
	
	Agendas = AppCollection.extend({
		url: '/agendas/',
		model: AgendaModel
	});

	module.setExports(Agendas);
});
