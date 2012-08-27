/*! app/models/sys_grouptype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_grouptype
*/
define("app/models/sys_grouptype",["require","app"],function(require,app) {
	var Sys_grouptypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_grouptypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_grouptypeModel)
});
