/*! app/models/category 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Category
*/
define("app/models/category",["require","app"],function(require,app) {
	var CategoryModel = app.Model.extend({
		url: function() {
			base = "/api/categories/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(CategoryModel)
});
