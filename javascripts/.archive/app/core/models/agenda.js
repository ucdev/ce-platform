/*! app/models/agenda 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Agenda
*/
define("app/models/Agenda",function(require,app) {
	app.models.Agenda = app.Model.extend({
			url: function() {
				base = "/api/agendas/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
