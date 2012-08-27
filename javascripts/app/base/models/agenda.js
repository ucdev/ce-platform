/*! app/models/agenda 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Agenda
*/
define("app/models/agenda",["require","app"],function(require,app) {
	var AgendaModel = app.Model.extend({
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
