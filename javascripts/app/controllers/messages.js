/*! ce.Controllers.Messages extends Backbone.Controller */
ce.pkg("Controllers",function(self,ce,Backbone,Marionette,$,_) {
	this.Messages = (function() {
		function messages() {
			var main;
			this.collection = new self.collection;
			main = $('#app');
			this.collection.reset(main.data('messages'));
			window.col = this.collection;
			main.removeData('messages');
		}
		
		messages.prototype.indexView = function() {
			var view;
			view = new self.views.indexView({
				collection: this.collection
			});
			
			return ce.mainRegion.show(view);
		};
		
		messages.prototype.editView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.editView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		messages.prototype.showView = function(id) {
			var obj, view;
			obj = this.collection.get(id);
			
			view = new self.views.showView({
				model: obj
			});
			
			return ce.mainRegion.show(view);
		};
		
		return messages;
		
	})();
});
