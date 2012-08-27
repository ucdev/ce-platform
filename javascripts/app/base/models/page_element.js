/*! app/models/page_element 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_element
*/
define("app/models/page_element",["require"],function(require) {
	var AppModel = require("app/model");
	var Page_elementModel = AppModel.extend({
		url: function() {
			base = "/api/page_elements/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Page_elementModel)
});
