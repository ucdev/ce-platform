/*! app/models/category 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Category
*/
define("app/models/Category",function(require,app) {
	app.models.Category = app.Model.extend({
			url: function() {
				base = "/api/categories/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
