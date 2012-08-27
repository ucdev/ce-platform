/*! app/models/entity_entitytype 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Entity_entitytype
*/
define("app/models/Entity_entitytype",function(require,app) {
	app.models.Entity_entitytype = app.Model.extend({
			url: function() {
				base = "/api/entity_entitytypes/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
