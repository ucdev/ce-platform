function activateCredit(id, checked) {
	var $creditAmount = $('.js-amount-' + id);
	var $refNo = $('.js-reference-' + id);
	
	if(checked) {
		$creditAmount.attr("disabled", false);
		$refNo.attr("disabled", false);
	} else {
		$creditAmount.attr("disabled", true);
		$refNo.attr("disabled", true);
	}
}

function postSave(data) {
	var $checkBox = $(".js-check-box");
	
	$checkBox.each(function(i, item) {
		var id = this.id.split('-')[1];
		var $creditAmount = $('.js-amount-' + id);
		var $refNo = $('.js-reference-' + id);
		
		if(!$(this).attr('checked')) {
			$creditAmount.val(0);
			$refNo.val('');
		}
	});
}

$(document).ready(function() {
	var $checkBox = $(".js-check-box");
	
	$checkBox.each(function() {
		activateCredit(this.id.split('-')[1], $(this).attr("checked"));
	});
	
	$checkBox.click(function() {
		activateCredit(this.id.split('-')[1], $(this).attr("checked"));
	});
});