/*! app/models/pagelayout 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayout
*/
define("app/models/pagelayout",["require"],function(require) {
	var AppModel = require("app/model");
	var PagelayoutModel = AppModel.extend({
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
