/*! app/models/sys_grouping 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouping
*/
define("app/models/sys_grouping",["require","app"],function(require,app) {
	var Sys_groupingModel = app.Model.extend({
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
