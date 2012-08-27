/*! app/models/pagelayoutmenu_page 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu_page
*/
define("app/models/pagelayoutmenu_page",["require"],function(require) {
	var AppModel = require("app/model");
	var Pagelayoutmenu_pageModel = AppModel.extend({
		url: function() {
			base = "/api/pagelayoutmenu_pages/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(Pagelayoutmenu_pageModel)
});
