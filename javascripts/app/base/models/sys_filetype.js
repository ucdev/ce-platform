/*! app/models/sys_filetype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_filetype
*/
define("app/models/sys_filetype",["require","app"],function(require,app) {
	var Sys_filetypeModel = app.Model.extend({
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
