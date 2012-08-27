/*! app/models/file 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.File
*/
define("app/models/File",function(require,app) {
	app.models.File = app.Model.extend({
			url: function() {
				base = "/api/files/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
