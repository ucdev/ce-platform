<script>

CE.Models.credit_request = Backbone.Model.extend({});

CE.Collections.credit_requests = Backbone.Collection.extend({
	model: CE.Models.credit_request
});

CE.Views.credit_requests = CE.Views.credit_requests || {};

CE.Views.credit_requests.row = Backbone.Marionette.ItemView.extend({
	template: "#row-template",
	tagName: 'tr',
	className: 'requestItem'
});

CE.Views.credit_requests.list = Backbone.Marionette.CompositeView.extend({
	tagName: "table",
	id: "credit_requests",
	className: "table-striped table-bordered",
	template: "#list-template",
	itemView: CE.Views.credit_requests.row,
	
	appendHtml: function(collectionView, itemView){
		collectionView.$("tbody").append(itemView.el);
	}
});


CE.addInitializer(function(options) {
	debug.info("Loading Tier3...");
	var creditRequestsView = new CE.Views.credit_requests.list({
		collection: options.requests
	});
	
	CE.tier3.show(creditRequestsView);
	debug.info("Tier3 complete.");
});

MyApp.addInitializer(function(options){
  // do useful stuff here
  var myView = new MyView({
    model: options.someModel
  });
  MyApp.mainRegion.show(myView);
});
</script>
<cfoutput>



</cfoutput>