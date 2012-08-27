/*! app/models/sys_historytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_historytype
*/
define("app/models/sys_historytype",["require","app"],function(require,app) {
	var Sys_historytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_historytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_historytypeModel)
});
