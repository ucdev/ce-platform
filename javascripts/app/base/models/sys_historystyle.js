/*! app/models/sys_historystyle 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historystyle
*/
define("app/models/sys_historystyle",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_historystyleModel = AppModel.extend({
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
