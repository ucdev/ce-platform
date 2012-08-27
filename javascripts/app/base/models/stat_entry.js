/*! app/models/stat_entry 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_entry
*/
define("app/models/stat_entry",["require"],function(require) {
	var AppModel = require("app/model");
	var Stat_entryModel = AppModel.extend({
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
