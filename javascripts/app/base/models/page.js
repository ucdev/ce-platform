/*! app/models/page 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page
*/
define("app/models/page",["require"],function(require) {
	var AppModel = require("app/model");
	var PageModel = AppModel.extend({
		url: function() {
			base = "/api/pages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PageModel)
});
