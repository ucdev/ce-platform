var StatusCount = 0;

function addMessage(sStatus,nFadeIn,nFadeTo,nFadeOut) {
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

function addError(sStatus,nFadeIn,nFadeTo,nFadeOut) {
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


function SubmitForm(oForm) {
	oForm.submit();
}

function getResources() {
	getSprites();	
}

function getSprites() {
	var resources = [];
	$('[class^="icon16-"],[class*=" icon16-"]').each(function(i,val) {
		var classes = $(this).attr('class').split(' ');
		$(classes).each(function(i,val) {
			//console.log(val);
			if (val !== '') {
				resources.push(val);
			}
		});
	});
	
	resources = resources.unique().sort();	
	
	$.ajax({
		   url:'/resources/sprites/',
		   type:'post',
		   data:{
				'images':resources
		   },
		   success:function(data) {
				$('head').append('<link rel="stylesheet" href="/stylesheets/' + version_token + '/sprites/' + $.trim(data) + '.css" type="text/css" />'); 
		   }
	});
}

$(function(){
	getResources();
	
    $('input').keydown(function(e){
        if (e.keyCode == 13) {
            $(this).parents('form').submit();
            return false;
        }
    });
	
	/* catch all ajax */
	$("body").ajaxSuccess(function(ev,xhr) {
		var response = $.parseJSON(xhr.responseText);
		
		if(response.STATUSMSG == 'login_required') {
			
		}
	});
	
	$(".dialogLink").on("click",function(e) {
		var $this = $(this);
		var $href = $this.attr('href');
		var $options = $this.attr('data-options');
		var $settings = {
			open: function(event, ui) { 
				$.ajax({
					url:$href,
					
				});
			}
			
		};
		$.dialog($options);
	});
});

Array.prototype.unique = function () {
	var arrVal = this;
	var uniqueArr = [];
	for (var i = arrVal.length; i--; ) {
		var val = arrVal[i];
		if ($.inArray(val, uniqueArr) === -1) {
			uniqueArr.unshift(val);
		}
	}
	return uniqueArr;
}
/* HISTORY OBJECT */
function historyList(properties) {
	/* SET DEFAULT VALUES */
	var $this = this;
	var settings = properties;
	var dataToSend = {
		personfrom:0,
		personto:0,
		activityto:0,
		startrow:1,
		maxrows:25
	};
	
	//console.log(settings);
	
	$this.setMode = function(mode) {
		settings.mode = mode;
	}
	
	$this.setStartRow = function(startrow) {
		settings.data.startrow = startrow;
	}
	
	$this.setMaxRows = function(maxrows) {
		settings.data.maxrows = maxrows;
	}
		
	$this.getList = function(clear,startTime,inject) {
		if(!inject) {
			inject = 'append';	
		}
		dataToSend = {
			personfrom:0,
			personto:0,
			startrow:1,
			maxrows:25,
			starttime:startTime
		};
		switch(settings.mode) {
			case 'activityTo':
				dataToSend.activityto = settings.data.activityto;
				
			break;
			
			case 'personTo':
				dataToSend.personto = settings.data.personto;
				
			break;
			
			case 'personFrom':
				dataToSend.personfrom = settings.data.personfrom;
				
			break;
			
			case 'personAll':
				dataToSend.personto = settings.data.personto;
				dataToSend.personfrom = settings.data.personfrom;
			break;
			
			case 'all':
			
			break;
		}
		dataToSend.startrow = settings.data.startrow;
		dataToSend.maxrows = settings.data.maxrows;
		
		//console.log(settings.mode);
		//console.log(dataToSend);
		
		if(clear) {
		settings.appendto.find('.history-item').remove();
		}
		listHistory(settings.appendto,dataToSend,inject);
	}
}

// Takes an ISO time and returns a string representing how
// long ago the date represents.
function prettyDate(time){
	var date = new Date((time || "").replace(/-/g,"/").replace(/[TZ]/g," ")),
		diff = (((new Date()).getTime() - date.getTime()) / 1000),
		day_diff = Math.floor(diff / 86400);
	if ( isNaN(day_diff) || day_diff < 0 || day_diff >= 31 )
		return $.DateFormat(date, "mmm dd, yyyy");
			
	return day_diff == 0 && (
			diff < 60 && "just now" ||
			diff < 120 && "1 minute ago" ||
			diff < 3600 && Math.floor( diff / 60 ) + " minutes ago" ||
			diff < 7200 && "1 hour ago" ||
			diff < 86400 && Math.floor( diff / 3600 ) + " hours ago") ||
		day_diff == 1 && "Yesterday" ||
		day_diff < 7 && day_diff + " days ago" ||
		day_diff < 31 && Math.ceil( day_diff / 7 ) + " weeks ago";
}

// If jQuery is included in the page, adds a jQuery plugin to handle it as well
if ( typeof jQuery != "undefined" )
	jQuery.fn.prettyDate = function(){
		return this.each(function(){
			var date = prettyDate(this.title);
			if ( date )
				jQuery(this).text( date );
		});
	};


function listHistory(appendTo,params,inject) {
	var output = '';
	$.ajax({
		url:"/admin/_com/ajax_history.cfc?method=list",
		dataType:'json',
		type:'GET',
		data:params,
		success:function(data, textStatus, XMLHttpRequest) 
			{
				//console.log(data);
				$.each(data.DATASET,function(i,item) {
					var $historyitem = '';
					if(inject == 'append') {
						appendTo.append(renderHistoryItem(item));
						$historyitem = $("#history-item-" + item.HISTORYID);
						$historyitem.show();
					} else if (inject == 'prepend') {
						appendTo.prepend(renderHistoryItem(item));
						$historyitem = $("#history-item-" + item.HISTORYID);
						$historyitem.fadeIn();
					}
					
					$historyitem.find(".history-meta a").prettyDate();
					$historyitem.find(".prettydate").prettyDate();
					setInterval(function(){ $historyitem.find(".history-meta a").prettyDate(); }, 5000);
					setInterval(function(){ $historyitem.find(".prettydate").prettyDate(); }, 5000);
				});
				
				
				//appendTo.find(".history-meta a").text();
			}
		});
}

function renderHistoryItem(row) {
	var re = /%[A-Za-z]+%/g;
	var ReturnContent = row.TEMPLATEFROM;
	
	var aFoundFields = ReturnContent.match(re);
	var sOutput = "";
	var ToContent = "";
	
	
	$.each(aFoundFields,function(i,item) {
		ReturnContent = ReturnContent.replace(item,item.toUpperCase());
		VarName = $.trim($.Replace(item,"%","","ALL")).toUpperCase();
		//console.log(item + " = " + VarName + " = " + eval("row." + VarName));
		//console.log(VarName);
		ReturnContent = $.Replace(ReturnContent,VarName,eval("row." + VarName.toUpperCase()),"ALL");
	});
	
	//console.log(ReturnContent);
	
	ToContent = $.Replace(row.TOCONTENT,"/index.cfm/event/",sMyself,"ALL");
	var $item = $("<div/>")
					.addClass('uiStoryItem')
					.attr({
						  id:"uiStoryItem-" + row.HISTORYID
						  });
			
	sOutput = "<div class=\"history-item clearfix\" id=\"history-item-" + row.HISTORYID + "\" style=\"display:none;\">" +
				"<div class=\"history-line clearfix\"><a class=\"uiImage-i\" href=\"/person/general?personId=" + row.FROMPERSONID + "\"><img src=\"" + row.FROMPERSONIMAGE + "\" border=\"0\" /></a>" + ReturnContent + "</div>";
	if(ToContent) {
		sOutput = sOutput + "<div class=\"mvm plm history-subbox\">" + 
			ToContent +
			"<div style=\"clear:both;\"></div>" +
			"</div>";
			
	}
	sOutput = sOutput + "<div class=\"history-meta\"><a title=\"" + row.CREATED + "\">" + row.CREATED + "</a></div>" +
			"</div>";
		
		sOutput = $.Replace(sOutput,"%","","ALL");
	
	return sOutput;
}

$(function(){
    $('input').keydown(function(e){
        if (e.keyCode == 13) {
            $(this).parents('form').submit();
            return false;
        }
    });
	/*if(loggedIn) {
		startDefibrillator();	
	}*/
	
	$("input.DatePicker").mask("99/99/9999");
	
	$("#date1").mask("99/99/9999");
	$("#date2").mask("99/99/9999");
	$("#date3").mask("99/99/9999");
	$("#date4").mask("99/99/9999");
	$("#date5").mask("99/99/9999");
	$("#date6").mask("99/99/9999");
	$("#date7").mask("99/99/9999");
	$("#date8").mask("99/99/9999");
	$("#date9").mask("99/99/9999");
	$("#date10").mask("99/99/9999");
	$("#date11").mask("99/99/9999");
	$("#date12").mask("99/99/9999");
	
	$(".AppDate").mask("99/99/9999");
	
	$("#phone1").mask("(999) 999-9999");
	$("#phone2").mask("(999) 999-9999");
	$("#phone3").mask("(999) 999-9999");
	$("#phone4").mask("(999) 999-9999");
	$("#phone5").mask("(999) 999-9999");
	$("#phone6").mask("(999) 999-9999");
	$("#phone7").mask("(999) 999-9999");
	$("#phone8").mask("(999) 999-9999");
	$("#fax1").mask("(999) 999-9999");
	$("#fax2").mask("(999) 999-9999");
	$("#tin").mask("99-9999999");
	$("#ssn").mask("9999");
	
	$(".control-label").each(function(i,val) {
		var text = $(val).text();
		var newText = text + ':'
		
		$(val).text(newText);
	});
});

/*UTIL = {
	exec: function( controller, action ) {
	var ns = SITENAME,
	action = ( action === undefined ) ? "init" : action;
	 
	if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {ns[controller][action]();}
	},
	 
	init: function() {
	var body = document.body,
	controller = body.getAttribute( "data-controller" ),
	action = body.getAttribute( "data-action" );
	 
	UTIL.exec( "common" );
	UTIL.exec( controller );
	UTIL.exec( controller, action );
}
};
 
$( document ).ready( UTIL.init );*/