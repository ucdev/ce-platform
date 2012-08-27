/*! app/models/page 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Page
*/
define("app/models/page",["require","app"],function(require,app) {
	var PageModel = app.Model.extend({
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
