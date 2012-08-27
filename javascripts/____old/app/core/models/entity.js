/*! app/models/entity 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity
*/
define("app/models/Entity",function(require,app) {
	app.models.Entity = app.Model.extend({
			url: function() {
				base = "/api/entities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
