/*! app/models/sys_entrytype 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Sys_entrytype
*/
define("app/models/sys_entrytype",["require","app"],function(require,app) {
	var Sys_entrytypeModel = app.Model.extend({
		url: function() {
			base = "/api/sys_entrytypes/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Sys_entrytypeModel)
});
