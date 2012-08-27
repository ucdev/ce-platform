/*! app/models/pagelayoutmenu 
* 	@requires: app/model
* 	@extends: app.Model
* 	@exports: app.models.Pagelayoutmenu
*/
define("app/models/pagelayoutmenu",["require"],function(require) {
	var AppModel = require("app/model");
	var PagelayoutmenuModel = AppModel.extend({
		url: function() {
			base = "/api/pagelayoutmenus/"
            
            if(this.isNew()) {
                return base
            } else {
                return base + this.id
            }
		}
	});

	module.setExports(PagelayoutmenuModel)
});
