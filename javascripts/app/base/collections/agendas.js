/*! app/collections/agendas
* 	@requires: app,app/models/agenda
* 	@extends: app.Collection
* 	@exports: app.collections.Agendas
*/
define("app/collections/agendas",["require","app","app/models"],function(require,app) {
	var AgendaModel = require("app/models/agenda");

	var Agendas = app.Collection.extend({
		url: '/agendas/',
		model: AgendaModel
	});

	module.setExports(Agendas);
});
