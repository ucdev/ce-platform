/*! app/models/sys_filetype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_filetype
*/
define("app/models/Sys_filetype",function(require,app) {
	app.models.Sys_filetype = app.Model.extend({
			url: function() {
				base = "/api/sys_filetypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
