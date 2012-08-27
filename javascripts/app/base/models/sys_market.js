/*! app/models/sys_market 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_market
*/
define("app/models/sys_market",["require","app"],function(require,app) {
	var Sys_marketModel = app.Model.extend({
		url: function() {
			base = "/api/sys_markets/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_marketModel)
});
