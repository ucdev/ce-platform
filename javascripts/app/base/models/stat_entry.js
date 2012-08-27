/*! app/models/stat_entry 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Stat_entry
*/
define("app/models/stat_entry",["require","app"],function(require,app) {
	var Stat_entryModel = app.Model.extend({
		url: function() {
			base = "/api/stat_entries/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Stat_entryModel)
});
