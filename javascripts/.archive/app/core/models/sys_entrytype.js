/*! app/models/sys_entrytype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_entrytype
*/
define("app/models/Sys_entrytype",function(require,app) {
	app.models.Sys_entrytype = app.Model.extend({
			url: function() {
				base = "/api/sys_entrytypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
