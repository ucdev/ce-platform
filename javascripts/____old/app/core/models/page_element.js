/*! app/models/page_element 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_element
*/
define("app/models/Page_element",function(require,app) {
	app.models.Page_element = app.Model.extend({
			url: function() {
				base = "/api/page_elements/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
