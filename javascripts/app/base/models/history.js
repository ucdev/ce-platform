/*! app/models/history 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.History
*/
define("app/models/history",["require"],function(require) {
	var AppModel = require("app/model");
	var HistoryModel = AppModel.extend({
		url: function() {
			base = "/api/histories/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(HistoryModel)
});
