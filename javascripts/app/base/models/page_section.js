/*! app/models/page_section 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Page_section
*/
define("app/models/page_section",["require"],function(require) {
	var AppModel = require("app/model");
	var Page_sectionModel = AppModel.extend({
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
