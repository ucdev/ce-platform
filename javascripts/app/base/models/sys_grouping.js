/*! app/models/sys_grouping 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouping
*/
define("app/models/sys_grouping",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_groupingModel = AppModel.extend({
		url: function() {
			base = "/api/sys_groupings/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_groupingModel)
});
