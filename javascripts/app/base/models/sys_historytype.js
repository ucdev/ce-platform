/*! app/models/sys_historytype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historytype
*/
define("app/models/sys_historytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_historytypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_historytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_historytypeModel)
});
