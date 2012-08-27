/*! app/models/sys_addresstype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_addresstype
*/
define("app/models/Sys_addresstype",function(require,app) {
	app.models.Sys_addresstype = app.Model.extend({
			url: function() {
				base = "/api/sys_addresstypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
