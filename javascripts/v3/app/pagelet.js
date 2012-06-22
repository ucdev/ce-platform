$.Class("ccpd.pagelet",{
	init:function(controller,action) {
		this.controller = new ccpd[controller](action);
	}
});

(function(){
	var pagelet = new ccpd.pagelet;
})();