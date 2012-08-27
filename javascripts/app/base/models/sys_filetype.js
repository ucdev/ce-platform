/*! app/models/sys_filetype 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_filetype
*/
define("app/models/sys_filetype",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_filetypeModel = AppModel.extend({
		url: function() {
			base = "/api/sys_filetypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_filetypeModel)
});
