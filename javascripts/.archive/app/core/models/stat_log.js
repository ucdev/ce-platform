/*! app/models/stat_log 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_log
*/
define("app/models/Stat_log",function(require,app) {
	app.models.Stat_log = app.Model.extend({
			url: function() {
				base = "/api/stat_logs/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
