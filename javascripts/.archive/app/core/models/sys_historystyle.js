/*! app/models/sys_historystyle 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historystyle
*/
define("app/models/Sys_historystyle",function(require,app) {
	app.models.Sys_historystyle = app.Model.extend({
			url: function() {
				base = "/api/sys_historystyles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
