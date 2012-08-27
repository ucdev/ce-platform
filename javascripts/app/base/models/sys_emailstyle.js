/*! app/models/sys_emailstyle 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_emailstyle
*/
define("app/models/sys_emailstyle",["require","app"],function(require,app) {
	var Sys_emailstyleModel = app.Model.extend({
		url: function() {
			base = "/api/sys_emailstyles/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_emailstyleModel)
});
