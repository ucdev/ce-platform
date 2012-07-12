/*!
 * CE Platform
 * http://ccpd.uc.edu/
 * 
 * Copyright (c)2012 University of Cincinnati
 * You are not authorized to use this code without receiving direct concent from the University of Cincinnati.
 *
 * @module: activity_credits
 * @def: Controller
 */
 
ce.module("activity_credits",function(self,ce,Backbone,Marionette,$,_) {
	this.controller = (function() {
		function activity_credits() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('activity_credits'));
			window.col = this.collection;
			main.removeData('activity_credits');
		}
		
		activity_credits.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_credits.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_credits.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return activity_credits;
		
	})();
});
