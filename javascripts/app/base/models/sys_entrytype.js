/*! app/models/sys_entrytype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_entrytype
*/
define("app/models/sys_entrytype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_entrytypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_entrytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_entrytypeModel)
});
