/*! app/models/filegroup 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Filegroup
*/
define("app/models/filegroup",["require","app"],function(require,app) {
	var FilegroupModel = app.Model.extend({
		url: function() {
			base = "/api/filegroups/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(FilegroupModel)
});
