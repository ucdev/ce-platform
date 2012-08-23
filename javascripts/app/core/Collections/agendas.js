/*! app/core/collections/Agendas */
define("app/core/collections/Agendas",function() {
	var Agendas = Backbone.Collection.extend({
			url: '/agendas/',
			model: models.Agenda
		});

	exports.Agendas = Agendas;
});
