/*! app/models/sys_projecttype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_projecttype
*/
define("app/models/sys_projecttype",["require","app"],function(require,app) {
	var Sys_projecttypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_projecttypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_projecttypeModel)
});
