/*! app/models/sys_specialtylm 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_specialtylm
*/
define("app/models/sys_specialtylm",["require","app"],function(require,app) {
	var Sys_specialtylmModel = app.Model.extend({
		url: function() {
			base = "/api/sys_specialtylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_specialtylmModel)
});
