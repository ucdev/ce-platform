/*! app/models/sys_addresstype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_addresstype
*/
define("app/models/sys_addresstype",["require","app"],function(require,app) {
	var Sys_addresstypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_addresstypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_addresstypeModel)
});
