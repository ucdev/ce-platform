var StatusCount = 0;

function addMessage(sStatus,nFadeIn,nFadeTo,nFadeOut) {
	$("##StatusBar").show();
	StatusCount++;
	$("##StatusBar").append("<div style=\"display:none;\" class=\"PageMessages\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
	//console.log("Status: " + StatusCount);
	$("##StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);
}

function addError(sStatus,nFadeIn,nFadeTo,nFadeOut) {
	$("##StatusBar").show();
	StatusCount++;
	$("##StatusBar").append("<div style=\"display:none;\" class=\"PageErrors\" id=\"StatusBox" + StatusCount + "\">" + sStatus + "</div>");
	$("##StatusBox" + StatusCount).show("slide",{direction: "down"},500).fadeTo(nFadeTo,.9).hide("slide",{direction: "down"},nFadeOut);
}