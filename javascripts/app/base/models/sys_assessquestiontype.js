/*! app/models/sys_assessquestiontype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessquestiontype
*/
define("app/models/sys_assessquestiontype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_assessquestiontypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_assessquestiontypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_assessquestiontypeModel)
});
