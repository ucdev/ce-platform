$.Class("ccpd.activities",
	/*
	@STATIC PROPERTIES / METHODS
	*/
	{
	},
	/*
	@PROTOTYPE PROPERTIES / METHODS
	*/
	{
		init: function(action) {
			this.view = new ccpd.activities[action]();
		}
	}
);