/*! ce.Controllers.Participants extends Backbone.Controller */
ce.pkg("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Participants = (function() {
		function participants() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('participants'));
			window.col = this.collection;
			main.removeData('participants');
		}
		
		participants.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		participants.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		participants.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return participants;
		
	})();
});
