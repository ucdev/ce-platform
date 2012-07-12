/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activities
 * @def: Controller
 */
 
ce.module("controllers.activities",function(self,ce,Backbone,Marionette,$,_) {
	this.controller = (function() {
		function activities() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('activities'));
			window.col = this.collection;
			main.removeData('activities');
		}
		
		activities.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		activities.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		activities.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return activities;
		
	})();
});
