/*! app/models/sys_categorylm 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_categorylm
*/
define("app/models/sys_categorylm",["require"],function(require) {
	var AppModel = require("app/model");
	var Sys_categorylmModel = AppModel.extend({
		url: function() {
			base = "/api/sys_categorylms/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_categorylmModel)
});
