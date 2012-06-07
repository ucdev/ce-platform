<script>

$(document).ready(function() {

var activityid = <cfoutput>#attributes.activityid#</cfoutput>;
var lister = new historyList({
		mode:"activityTo",
		appendto:$(".ViewSection"),
		data:{
			activityto:activityid,
			startrow:1,
			maxrows:25
		}
	});

lister.getList(true);
});
/*$(".history-filter ul li a").click(function() {
	var $link = $(this);
	var $parent = $link.parent();
	var mode = $parent.attr('id').replace('history-','');
	var label = $link.text();
	
	lister.setMode(mode);

	lister.getList(true);
	
	$(".ViewSection h3").text(label);
	return false;
});*/
</script>

<div class="ViewSection">
<h3>History</h3>

</div>