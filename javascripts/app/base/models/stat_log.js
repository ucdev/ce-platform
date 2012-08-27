/*! app/models/stat_log 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_log
*/
define("app/models/stat_log",["require"],function(require) {
	var AppModel = require("app/model");
	var Stat_logModel = AppModel.extend({
		url: function() {
			base = "/api/stat_logs/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Stat_logModel)
});
