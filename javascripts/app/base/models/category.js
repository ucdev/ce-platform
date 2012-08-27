/*! app/models/category 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Category
*/
define("app/models/category",["require"],function(require) {
	var AppModel = require("app/model");
	var CategoryModel = AppModel.extend({
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
