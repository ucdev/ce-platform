/*! app/models/sys_market 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_market
*/
define("app/models/Sys_market",function(require,app) {
	app.models.Sys_market = app.Model.extend({
			url: function() {
				base = "/api/sys_markets/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
