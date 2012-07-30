/*! ce.Controllers.Activity_participants extends Backbone.Controller */
ce.module("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Activity_participants = (function() {
		function activity_participants() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('activity_participants'));
			window.col = this.collection;
			main.removeData('activity_participants');
		}
		
		activity_participants.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_participants.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			var test;
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		activity_participants.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return activity_participants;
		
	})();
});
