/*! app/models/authority 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Authority
*/
define("app/models/Authority",function(require,app) {
	app.models.Authority = app.Model.extend({
			url: function() {
				base = "/api/authorities/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
