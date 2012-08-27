/*! app/models/sys_historytype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_historytype
*/
define("app/models/Sys_historytype",function(require,app) {
	app.models.Sys_historytype = app.Model.extend({
			url: function() {
				base = "/api/sys_historytypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
