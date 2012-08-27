/*! app/models/history 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.History
*/
define("app/models/history",["require","app"],function(require,app) {
	var HistoryModel = app.Model.extend({
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
