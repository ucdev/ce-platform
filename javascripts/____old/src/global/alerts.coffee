ce.module "global.alerts", (self, ce, Backbone, Marionette, $, _) ->
  self.showMessage = ce.showMessage = (sStatus, nFadeIn, nFadeTo, nFadeOut) ->
    
    # DECLARE ELEMENT
    $alert = $("<div />").addClass("alert alert-success").html(sStatus)
    
    # STYLE ELEMENT
    $alert.css
      position: "fixed"
      display: "none"

    
    # ATTACH TO HTML
    $alert.prependTo ".infoBar"
    
    # FADE IN
    $alert.fadeIn nFadeIn, ->
      
      # PAUSE MESSAGE ON SCREEN
      setTimeout (->
        
        # FADE OUT
        $alert.animate
          opacity: 0
        , nFadeOut
      ), nFadeTo, ->
        $alert.remove()



  
  #$("#StatusBar").show();
  #		StatusCount++;
  #		$("#StatusBar").append("<div style=\"display:none;\" class=\"PageMessages\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
  #		//console.log("Status: " + StatusCount);
  #		$("#StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);
  self.showError = ce.showError = (sStatus, nFadeIn, nFadeTo, nFadeOut) ->
    
    # DECLARE ELEMENT
    $alert = $("<div />").addClass("alert alert-error").html(sStatus)
    
    # STYLE ELEMENT
    $alert.css
      position: "fixed"
      display: "none"

    
    # ATTACH TO HTML
    $alert.prependTo ".infoBar"
    
    # FADE IN
    $alert.fadeIn nFadeIn, ->
      
      # PAUSE MESSAGE ON SCREEN
      setTimeout (->
        
        # FADE OUT
        $alert.animate
          opacity: 0
        , nFadeOut
      ), nFadeTo, ->
        $alert.remove()




#$("#StatusBar").show();
#		StatusCount++;
#		$("#StatusBar").append("<div style=\"display:none;\" class=\"PageErrors\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
#		$("#StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);