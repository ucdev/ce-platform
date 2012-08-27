/*! app/collections/agendas
* 	@requires: app,app/collection,app/model
* 	@extends: app.Collection
* 	@exports: app.collections.Agendas
*/
define("app/collections/agendas",function(require,app) {
	var AgendaModel = require("app/models/agenda");

	app.collections.Agendas = app.Collection.extend({
		url: '/agendas/',
		model: AgendaModel
	});

	exports.app = app;
});
