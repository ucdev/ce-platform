/*! app/models/sys_assessquestiontype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Sys_assessquestiontype
*/
define("app/models/Sys_assessquestiontype",function(require,app) {
	app.models.Sys_assessquestiontype = app.Model.extend({
			url: function() {
				base = "/api/sys_assessquestiontypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
