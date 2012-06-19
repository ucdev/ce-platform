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

function updateAll() {
}

$(document).ready(function() {
	var id = $('.js-attendee-id');
	var $addressGeoname = $(".js-geonameid");
	var $btnEmailSent = $('.js-btn-emailSent');
	var $btnMD = $('.js-btn-md');
	var $btnPayment = $('.js-btn-payment');
	var $btnTerms = $('.js-btn-terms');
	var $statusSelector = $('.js-status');
	
	/* INIT START */
	// CHECK IF PAYMENT WAS MADE
	$btnPayment.each(function() {
		var val = this.id.split('-')[2]
		
		if($(this).hasClass('active') && val == 'y') {
			showPaymentInfo(val);
		}
	});
	
	// REVEAL ONLY DATES PERTAINING TO ATTENDEE
	showAttendeeDates($statusSelector.val());
	/* INIT END */
	
	$addressGeoname.uiTypeahead({
		ajaxSearchURL:'/geoname/findLocation',
		showImage:true,
		allowAdd:false,
		size:'full',
		defaultValue:geodata.id
	});
	
	/*$addressGeoname.tokenInput("http://ws.geonames.org/searchJSON?featureClass=P&style=full&maxRows=12",{
		queryParam:'name_startsWith',
		tokenLimit:1,
		tokenValue:'geonameId',
		onAdd: function(data) {
			console.log(data);
			var $city = $('.js-city');
			var $stateProvince = $('.js-state-province');
			
			$city.val(data.name);
			$stateProvince.val(data.adminCode1)
		},
		jsonContainer:'geonames',
		resultsFormatter:function(item) {
			return "<li>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</li>"
		},
		tokenFormatter:function(item) {
			return "<li><p>" + item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName + "</p></li>"
		}
	});*/
	
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