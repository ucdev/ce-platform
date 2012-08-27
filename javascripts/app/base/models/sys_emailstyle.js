/*! app/models/sys_emailstyle 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_emailstyle
*/
define("app/models/sys_emailstyle",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_emailstyleModel = AppModel.extend({
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
