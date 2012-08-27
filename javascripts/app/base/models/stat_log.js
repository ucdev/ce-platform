/*! app/models/stat_log 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Stat_log
*/
define("app/models/stat_log",["require","app"],function(require,app) {
	var Stat_logModel = app.Model.extend({
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
