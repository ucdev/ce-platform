/*! app/models/sys_emailstyle 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_emailstyle
*/
define("app/models/Sys_emailstyle",function(require,app) {
	app.models.Sys_emailstyle = app.Model.extend({
			url: function() {
				base = "/api/sys_emailstyles/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
