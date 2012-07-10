ce.controllers.activity_participants = Backbone.Controller.extend({
	routes: {
        "documents/:id":            "edit",
        "":                         "index",
        "new":                      "newDoc"
    },
    
	/*	INDEX
	 *	@URL: /activity_participants/index
	 */
    index: function() {
        var documents = new App.Collections.Documents();
        documents.fetch({
            success: function() {
                new App.Views.Index({ collection: documents });
            },
            error: function() {
                new Error({ message: "Error loading documents." });
            }
        });
    },
	
	/*	EDIT
	 *	@URL: /activity_participants/edit
	 */
    edit: function(id) {
        var doc = new Document({ id: id });
        doc.fetch({
            success: function(model, resp) {
                new App.Views.Edit({ model: doc });
            },
            error: function() {
                new Error({ message: 'Could not find that document.' });
                window.location.hash = '#';
            }
        });
    },
	
    newDoc: function() {
        new App.Views.Edit({ model: new Document() });
    }
});

