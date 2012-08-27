/*! app/models/page_section 
* 	@requires: app,app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_section
*/
define("app/models/Page_section",function(require,app) {
	app.models.Page_section = app.Model.extend({
			url: function() {
				base = "/api/page_sections/"
                
                if(this.isNew()) {
                    return base
                } else {
                    return base + this.id
                }
			}
		});

	exports.app = app;
});
