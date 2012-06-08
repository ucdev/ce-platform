<script>
$(document).ready(function() {
	updateCategories();
});

// REFRESH AHAH PAGE
function updateCategories() {
	$("#CategoriesLoading").show();
	$.post(sMyself + "Activity.PubCategoryAHAH", { ActivityID: nActivity }, function(data) {
		$("#CategoriesContainer").html(data);
		$("#CategoriesLoading").hide();
	});
}
</script>

<div class="ViewSection">
	<h3>Categories</h3>
	<div id="CategoriesContainer"></div>
	<div id="CategoriesLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>