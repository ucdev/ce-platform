function updateAll() {
}

function showAttendeeDates(status) {
	var completeDate = $('#complete-date');
	var registerDate = $('#register-date');
	var termDate = $('#term-date');
	switch(parseInt(status)) {
		case 1:
			$('#complete-date').show();
			$('#register-date').show();
			$('#term-date').hide();
			break;
			
		case 4:
			$('#complete-date').hide();
			$('#register-date').show();
			$('#term-date').show();
			break;
			
		default:
			$('#register-date').show();
			$('#complete-date').hide();
			$('#term-date').hide();
			break;
	}
}

function showPaymentInfo(paymentMade) {
	if(paymentMade == 'y') {
		$('.payment-made').show();
	} else {
		$('.payment-made').hide();
	}
}

function toggleButtons(type, elem) {
	var val = elem.attr('id').split('-')[2];
	
	$('.js-btn-' + type).removeClass('active');
	elem.addClass('active');
	$('.js-btn-' + type + 'Flag').val(val);
}

$(document).ready(function() {
	var id = $('.js-attendee-id');
	var $btnEmailSent = $('.js-btn-emailSent');
	var $btnMD = $('.js-btn-md');
	var $btnPayment = $('.js-btn-payment');
	var $btnTerms = $('.js-btn-terms');
	var $statusSelector = $('.js-status');
	
	/* INIT START */
	// MASK DATE FIELDS
	$('.js-date').mask('99/99/9999');
	
	// CHECK IF PAYMENT WAS MADE
	$btnPayment.each(function() {
		var val = this.id.split('-')[2]
		
		if($(this).hasClass('active') && val == 'y') {
			showPaymentInfo(val);
		}
	});
	
	// REVEAL ONLY DATES PERTAINING TO ATTENDEE
	showAttendeeDates($statusSelector.val())
	
	/* INIT END */
	
	$btnEmailSent.click(function() {
		toggleButtons('emailSent', $(this));
	});
	
	$btnMD.click(function() {
		toggleButtons('md', $(this));
	});
	
	$btnPayment.click(function() {
		toggleButtons('payment', $(this));

		showPaymentInfo(this.id.split('-')[2]);
	});
	
	$btnTerms.click(function() {
		toggleButtons('terms', $(this));
	});
	
	$statusSelector.change(function() {
		// REVEAL ONLY DATES PERTAINING TO ATTENDEE
		showAttendeeDates($(this).val())
	});
});