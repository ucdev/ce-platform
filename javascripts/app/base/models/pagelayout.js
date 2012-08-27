/*! app/models/pagelayout 
* 	@requires: app
* 	@extends: app.Model
* 	@exports: app.models.Pagelayout
*/
define("app/models/pagelayout",["require","app"],function(require,app) {
	var PagelayoutModel = app.Model.extend({
		url: function() {
			base = "/api/pagelayouts/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PagelayoutModel)
});
