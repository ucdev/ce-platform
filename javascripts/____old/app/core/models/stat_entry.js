/*! app/models/stat_entry 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Stat_entry
*/
define("app/models/Stat_entry",function(require,app) {
	app.models.Stat_entry = app.Model.extend({
			url: function() {
				base = "/api/stat_entries/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
