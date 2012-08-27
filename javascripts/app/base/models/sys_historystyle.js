/*! app/models/sys_historystyle 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_historystyle
*/
define("app/models/sys_historystyle",["require","app"],function(require,app) {
	var Sys_historystyleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_historystyles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_historystyleModel)
});
