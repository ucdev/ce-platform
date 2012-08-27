/*! app/models/sys_assesstype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assesstype
*/
define("app/models/sys_assesstype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assesstypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_assesstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assesstypeModel)
});
