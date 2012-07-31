ce.pkg("MozApp",function(self,ce,Backbone,Marionette,$,_,navigator) {
    self.testinstall = function() {
		if ((!navigator.mozApps) || (!navigator.mozApps.getSelf)) {
			/*-----------------------------------------------------------+
			|| Test to see if the Mozilla Apps Web Runtime is supported
			|| HACK: Testing for either mozApps OR mozApps.getSelf is a 
			|| hack. 
			|| This is needed because some pre-beta versions of Firefox 
			|| have the object present but nit fully implemented.
			|| TODO: Update when Firefox Desktop & Mobile are complete.
			------------------------------------------------------------*/
			return;
		}
	 
		self.mozSelf = navigator.mozApps.getSelf();
		
		self.mozSelf.onsuccess = function() {
			if (! this.result) {
				// Application is not "installed"
				$('#mozapp-install-btn').show();
			} else {
				// This "MozApp" is already installed.
			}
			return;
		}
		
		self.mozSelf.onerror = function() {
			alert('Error checking installation status: ' + this.error.message);
			return;
		}
	}
	
	$(function() {
		$('#mozapp-install-btn').click(function() {
			var installation = navigator.mozApps.install("http://ccpd.uc.edu/ccpd.webapp");
			
			installation.onsuccess = function() {
				$('#mozapp-install-btn').hide();
				alert("CCPD has been successfully installed.");
			}
			
			installation.onerror = function() {
				alert("Installer: The installation FAILED : " + this.error.name);
			}
		});
	});
},navigator);