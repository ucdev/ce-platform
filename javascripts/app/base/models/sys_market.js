/*! app/models/sys_market 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_market
*/
define("app/models/sys_market",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_marketModel = AppModel.extend({
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
