<script>
$(document).ready(function() {
	updateSpecialties();
});

// REFRESH AHAH PAGE
function updateSpecialties() {
	$("#SpecialtiesLoading").show();
	$.post(sMyself + "Activity.PubSpecialtyAHAH", { ActivityID: nActivity }, function(data) {
		$("#SpecialtiesContainer").html(data);
		$("#SpecialtiesLoading").hide();
	});
}
</script>

<div class="ViewSection">
	<h3>Specialties</h3>
	<div id="SpecialtiesContainer"></div>
	<div id="SpecialtiesLoading" class="Loading"><img src="/admin/_images/ajax-loader.gif" />
	<div>Please Wait</div></div>
</div>