ce.pkg("global.alerts",function(self,ce,Backbone,Marionette,$,_){
	self.showMessage = ce.showMessage = function(sStatus,nFadeIn,nFadeTo,nFadeOut) {
		// DECLARE ELEMENT
		var $alert = $('<div />').addClass('alert alert-success').html(sStatus);
		
		// STYLE ELEMENT
		$alert.css({
			'position':'fixed',
			'display':'none'
		});
		
		// ATTACH TO HTML
		$alert.prependTo('.infoBar');
		
		// FADE IN
		$alert.fadeIn(nFadeIn, function() {
				// PAUSE MESSAGE ON SCREEN
				setTimeout(function() {
					// FADE OUT
					$alert.animate({ opacity: 0 }, nFadeOut);
				}, nFadeTo, function() {
					$alert.remove();
				});
			}
		);
		
		/*$("#StatusBar").show();
		StatusCount++;
		$("#StatusBar").append("<div style=\"display:none;\" class=\"PageMessages\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
		//console.log("Status: " + StatusCount);
		$("#StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);*/
	}
	
	self.showError = ce.showError = function(sStatus,nFadeIn,nFadeTo,nFadeOut) {
		// DECLARE ELEMENT
		var $alert = $('<div />').addClass('alert alert-error').html(sStatus);
		
		// STYLE ELEMENT
		$alert.css({
			'position':'fixed',
			'display':'none'
		});
		
		// ATTACH TO HTML
		$alert.prependTo('.infoBar');
		
		// FADE IN
		$alert.fadeIn(nFadeIn, function() {
				// PAUSE MESSAGE ON SCREEN
				setTimeout(function() {
					// FADE OUT
					$alert.animate({ opacity: 0 }, nFadeOut);
				}, nFadeTo, function() {
					$alert.remove();
				});
			}
		);
		
		
		
		/*$("#StatusBar").show();
		StatusCount++;
		$("#StatusBar").append("<div style=\"display:none;\" class=\"PageErrors\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
		$("#StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);*/
	}
});