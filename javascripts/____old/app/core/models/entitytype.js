/*! app/models/entitytype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entitytype
*/
define("app/models/Entitytype",function(require,app) {
	app.models.Entitytype = app.Model.extend({
			url: function() {
				base = "/api/entitytypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
