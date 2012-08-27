/*! app/models/agenda 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Agenda
*/
define("app/models/agenda",["require"],function(require) {
	var AppModel = require("app/model");
	var AgendaModel = AppModel.extend({
		url: function() {
			base = "/api/agendas/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(AgendaModel)
});
