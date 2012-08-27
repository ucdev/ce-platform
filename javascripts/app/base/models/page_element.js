/*! app/models/page_element 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page_element
*/
define("app/models/page_element",["require","app"],function(require,app) {
	var Page_elementModel = app.Model.extend({
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
