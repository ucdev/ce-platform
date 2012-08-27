/*! app/models/page_section 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page_section
*/
define("app/models/page_section",["require","app"],function(require,app) {
	var Page_sectionModel = app.Model.extend({
		url: function() {
			base = "/api/page_sections/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Page_sectionModel)
});
