/*! app/models/filegroup 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Filegroup
*/
define("app/models/Filegroup",function(require,app) {
	app.models.Filegroup = app.Model.extend({
			url: function() {
				base = "/api/filegroups/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
