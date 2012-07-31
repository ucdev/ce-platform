ce.pkg("ui.tokenizer",function(self,ce,Backbone,Marionette,$,_){
	// CEAuth - Form Field: Tokenizer Input
	var methods = {
		/* INITIAL SETTINGS / HTML INJECTION */
		init : function( options ) {
			var settings = $.extend(
								{},
								$.uiTokenizer.defaults,
								options
							);
			
			return this.each(function () {
				new $.uiTokenizer(this, settings);
			});
		}
	};
	/* METHOD CALLS */
	$.fn.uiTokenizer = function(method) {	
		if ( methods[method] ) {
		  return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
		} else if ( typeof method === 'object' || ! method ) {
		  return methods.init.apply( this, arguments );
		} else {
		  $.error( 'Method ' +  method + ' does not exist on uiTokenizer' );
		}
	};
	
	/* TOKENIZE - Internal core logic */
	$.uiTokenizer = function(input,settings) {
		/*log(input);
		log(settings);*/
		var KEY = {
			BACKSPACE: 8,
			TAB: 9,
			RETURN: 13,
			ESC: 27,
			LEFT: 37,
			UP: 38,
			RIGHT: 39,
			DOWN: 40,
			COMMA: 188,
			ENTER: 13,
			DELETE: 46
		};
		// storage variables
		var token_items = [];
		
		
		// ORIGINAL INPUT - hidden
		var $hiddenInput = $(input)
								.hide()
								.focus(function () { })
								.blur(function () { 
										$input.blur(); 
									});
		
		
		var fieldName = $hiddenInput.attr('name');
		
		// TOKENIZER WRAPPER - contains all elements for this instance of the tokenizer
		var $wrapper = $('<div/>').addClass('uiTokenizer mrl');
		
		switch(settings.type) {
			case 'token':
				settings.typeOpts = {
					imgSize:0,
					dragOffset:{
						top:-10,
						left:-30
					}
				}
			break;
			case 'tokenImage':
				settings.typeOpts = {
					imgSize:62,
					dragOffset:{
						top:23,
						left:30
					}
				}
				
				$wrapper.addClass('uiImageTokenizer');
				break;
			case 'list':
				settings.typeOpts = {
					imgSize:0,
					dragOffset:{
						top:-10,
						left:40
					}
				}
				$wrapper.addClass('uiListTokenizer');
				break;
			case 'listImage':
				settings.typeOpts = {
					imgSize:16,
					dragOffset:{
						top:-10,
						left:40
					}
				}
				$wrapper.addClass('uiListImageTokenizer');
				break;
		}
		
		// TOKEN AREA - contains all of your tokens
		var $tokenarea = $('<div/>')
				.addClass('uiTokenarea hide clearfix');
				
		
				
		
		// INJECT ALL OF THE HTML INTO THE PAGE
		
		$wrapper.insertAfter($hiddenInput);
		
		// AUTOCOMPLETE (requires jQuery UI autocomplete widget
		$hiddenInput.uiTypeahead({
			watermarkText:settings.watermarkText,
			defaultValue:null, /* array or single value */
			queryParam:'q',
			appendTo:$wrapper,
			clearOnSelect:true,
			ajaxSearchURL:settings.ajaxSearchURL,
			ajaxSearchType:settings.ajaxSearchType,
			ajaxSearchParams:settings.ajaxSearchParams,
			ajaxAddURL:settings.ajaxAddURL,
			ajaxAddType:settings.ajaxAddType,
			ajaxAddParams:settings.ajaxAddParams,
			onSelect:function(item) {
				if(!($.inArray(item.value,token_items) >= 0)) {
					token_add(item,true);
					//console.log(token_items);
				}
				
				return false;
			}
		});
		
		
		if(settings.listLocation == 'top') {
			$tokenarea.prependTo($wrapper);
		} else {
			$tokenarea.appendTo($wrapper);
		}
		
		var refreshTokens = function(clickOffset) {
			var counter = 0;
			tokens = $tokenarea.children('.uiToken').not('.droppable_placeholder');
			if(clickOffset){
				
			} else {
				clickOffset = { x:0,y:0 }    
			}
			if(settings.type == 'tokenImage') {
				var textAll = '';
				tokens.each(function() {
					var token = $(this);
					var index = token.index();
					var text = token.find('.text').text();
					
					textAll = textAll + ', ' + text;
					if(counter < 5) {
						makeTokenShown(token);
					} else {
						makeTokenHidden(token);
						//        marginOffset = parseInt($(token).height() * clickOffset.y);
						/*if($(token).hasClass('drag')) {
							$(token).css({
								'margin-top':'auto'
							});
						} else {
							$(token).css({
								'margin-top':'auto'
							});
						}
						console.log(marginOffset);*/
					}
					
					counter++;
				});
			}
		}
		
		function makeDragShown(ui) {
			ui.item.addClass('shown').removeClass('hidden').find('.tokenImg').show();
			ui.placeholder.addClass('shown shownPlaceholder').css({ height:102,width:72 }).removeClass('hidden hiddenPlaceholder').find('.tokenImg').show();
			ui.helper.addClass('shown shownPlaceholder').css({ height:102,width:72 }).removeClass('hidden hiddenPlaceholder').find('.tokenImg').show();
		}
		
		function makeDragHidden(ui) {
			ui.item.removeClass('shown').addClass('hidden').find('.tokenImg').hide();
			ui.placeholder.removeClass('shown shownPlaceholder').css({ height:16,width:72 }).addClass('hidden hiddenPlaceholder').find('.tokenImg').hide();
			ui.helper.removeClass('shown shownPlaceholder').css({ height:16,width:72 }).addClass('hidden hiddenPlaceholder').find('.tokenImg').hide();
			
		}
		
		function makeTokenShown(token) {
			token.addClass('shown').removeClass('hidden').find('.tokenImg').show();
			
			if(token.hasClass('drag')) {
				//console.log('drag');
			}
		}
		
		function makeTokenHidden(token) {
			token.removeClass('shown').addClass('hidden').find('.tokenImg').hide();
		}
		
		
		function is_printable_character(keycode) {
			if((keycode >= 48 && keycode <= 90) ||      // 0-1a-z
			   (keycode >= 96 && keycode <= 111) ||     // numpad 0-9 + - / * .
			   (keycode >= 186 && keycode <= 192) ||    // ; = , - . / ^
			   (keycode >= 219 && keycode <= 222)       // ( \ ) '
			  ) {
				  return true;
			  } else {
				  return false;
			  }
		}
		function load_default() {
			var list_items = settings.defaultValue;
			var token = {};
			
			$(list_items).each(function() {
				token_add(this,false);
			});
			//console.log($tokenarea.children('.uiToken').not('.droppable_placeholder'));
		}
		
		load_default();
		
		function typeahead_select(token) {
			token_add(token);
			$input.val('');
			$input.blur();
		}
		
		function refresh_binding(token) {
			if(!token) {
				var tokens = $tokenarea.children('.uiToken').not('.droppable_placeholder');
			} else {
				var tokens = token;
			}
			tokens.drag("init",function(ev,dd) {
				var placeholder = $("<span/>").addClass('uiToken droppable_placeholder');
				var siblings = $(this).siblings('.uiToken');
				$(this).data('placeholder',placeholder);
			})
			tokens.drag("start",function(ev,dd) {
				var placeholder = $(this).data('placeholder');
				var startIndex = $(this).index();
				var startHeight = $(this).height();
				var startWidth = $(this).width();
				var siblings = $(this).data('siblings');
				$(this).data("startIndex",startIndex);
				$(this).data("startHeight",startHeight);
				$(this).data("startWidth",startWidth);
				
				var clickOffset = {
					x:parseInt(ev.pageX-dd.originalX)/100,
					y:parseInt(ev.pageY-dd.originalY)/100
				};
				$(this).data("clickOffset",clickOffset);
				//placeholder.insertBefore($(this));
				var startOffset = $(this).height() * clickOffset.y;
				$(this).data("startOffset",startOffset);
				//console.log(startOffset);
				var container = $tokenarea.offset();
				
				$(this).addClass('drag');
				$(this).css({
					'z-index':'1000'
				});
			})
			.drag(function(ev,dd){
				var placeholder = $(this).data('placeholder');
				var clickOffset = $(this).data("clickOffset");
				var startOffset = $(this).data("startOffset");
				var startHeight = $(this).data("startHeight");
				var startWidth = $(this).data("startWidth");
				var startIndex = $(this).data("startIndex");
				var container = $tokenarea.offset();
				
				var rel = {
					y:parseInt(ev.pageY-container.top),
					x:parseInt(ev.pageX-container.left)
				};
				
				var top = rel.y;
				var left = rel.x;
				/*if(dd.drop[0]) {
					$("#stats-container").html('<div>' + $(dd.drop[0]).find('.text').text() + '</div>');
				} else {
					$("#stats-container").html('<div>' + $(this).find('.text').text() + '</div>');
				}*/
				//console.log(drop);
				var drop = dd.drop[0], method = $.data( drop || {}, "drop+reorder" );
				if($(drop).parents().filter($tokenarea).length>0) {
					$('#stat-container').html('<div>' + $(drop).text() + '</div>');
					if ( drop && $(drop).is('.uiToken') && ( drop != dd.current || method != dd.method ) ){    
						//$( this )[ method ]( drop );
						$(this).insertBefore(drop);
						/*$("#stats-container").html('<div>drop: ' + $(drop).find('.text').text() + '</div>' +
												   '<div>item: ' + $(this).find('.text').text() + '</div>');*/
						dd.current = drop;
						dd.method = method;
						dd.update();
						refreshTokens(clickOffset);
						//placeholder.insertBefore($(this));
					}
				} else {
					//placeholder.insertAfter($(this));
				}
				
				if(settings.type == 'tokenImage') {
					if($(this).index() > 4) {
						placeholder.addClass('hidden hiddenPlaceholder').removeClass('shown shownPlaceholder')
							.css({
								 height:$(this).height(),
								 width:$(this).width()
								 });
						
					} else {
						placeholder
							.addClass('shown shownPlaceholder')
							.removeClass('hidden hiddenPlaceholder')
							.css({
								 height:$(this).height()
								 });
					}
				} else {
					placeholder
						.removeClass('shown shownPlaceholder')
						.removeClass('hidden hiddenPlaceholder')
						.css({
							 height:$(this).height(),
							 width:$(this).width()
							 });
				}
				
				var currHeight = $(this).height();
				var currWidth = $(this).width();
				var currHeightOffset = (currHeight*clickOffset.y);
				var testY = parseFloat(ev.pageY-dd.offsetY) - parseFloat(currHeightOffset);
				var currWidthOffset = (currWidth*clickOffset.x);
				var testX = parseFloat(ev.pageX-dd.offsetX) - parseFloat(currWidthOffset);
				
				/*if(currWidth < startWidth) {
					left = parseFloat(left) + parseFloat(testX)*clickOffset.x;
					//console.log(testX);
				}
				
				if(currHeight < startHeight) {
					top = parseFloat(top) + parseFloat(testY);
					//console.log(top);
				}*/
				
				$(this).css({
					position:'relative',
					'z-index':'1000',
					'top':0,
					'left':0
				});
			},{ relative:true })
			.drag("end",function(ev,dd) {
				var placeholder = $(this).data('placeholder');
				var startIndex = $(this).data("startIndex");
				var container = $tokenarea.offset();
				placeholder.remove();
				
				if(startIndex != $(this).index()) {
					refreshHiddenInput();
				}
				
				$(this).css({
					position:'relative',
					'z-index':'0',
					top: 0,
					left: 0,
					'margin-top':'auto'
				});
				
				$(this).removeClass('drag');
			})
			.drop("init",function( ev, dd ){
				
				return !(this == dd.drag);
			});
			
			
		}
		
		function token_delete($token,item) {
			var override = settings.onRemove($token,item);
			if (override) {
				removeTokenFromArray(item.value);
				$token.remove();
			}
			//refreshHiddenInput();
		}
		
		function token_deselect($token) {
			$token.removeClass('uiTokenSelected').removeClass('uiTokenShownSelected');
			
			return false;
		}
		
		function token_select($token) {
			var $nextToken = $token.next();
			var $prevToken = $token.prev();
			
			$token.addClass('uiTokenSelected');
			
			if($token.hasClass('shown')) {
				$token.addClass('uiTokenShownSelected');
			}
			
			/*$(document).keydown(function(e) {
				if($token.hasClass('uiTokenSelected')) {
					switch(e.keyCode) {
						case KEY.LEFT:
							if($prevToken.is('.uiToken')) {
								token_deselect($token);
								$(document).unbind("keydown");
								token_select($prevToken);
							}
							break;
						case KEY.RIGHT:
							if($nextToken.is('.uiToken')) {
								token_deselect($token);
								$(document).unbind("keydown");
								token_select($nextToken);
							}
							break;
						case KEY.TAB:
							if(e.shiftKey) {
								if($prevToken.is('.uiToken')) {
								token_deselect($token);
								$(document).unbind("keydown");
								token_select($prevToken);
							}
							} else {
								if($nextToken.is('.uiToken')) {
									token_deselect($token);
									$(document).unbind("keydown");
									token_select($nextToken);
								}
							}
							break;
						case KEY.BACKSPACE:
							token_delete($token);
							$(document).unbind("keydown");
							
							refreshTokens();
							token_select($nextToken);
							break;
						case KEY.DELETE:
							token_delete($token);
							$(document).unbind("keydown");
							
							refreshTokens();
							token_select($nextToken);
							break;
						
		
						case KEY.ESC:
							token_deselect($token);
							$(document).unbind("keydown");
						break;
					}
				}
				return false;
			});*/
			
			$("body").click();
			$("html").one("click",function() {
				token_deselect($token);
			
				
				 return false;
			 });
			
			return false;
		}
		
		function refreshHiddenInput() {
			var tokenLabels = $('[name="' + fieldName + '_label"]').serializeArray();
			var tokenValues = $('[name="' + fieldName + '_value"]').serializeArray();
			var counter = 0;
			
			$hiddenInput.html("").val("");
			
			$(tokenLabels).each(function() {
				var option = $("<option/>")
								.val(tokenValues[counter].value)
								.attr('selected',true)
								.appendTo($hiddenInput)
								.text(tokenLabels[counter].value);
				counter++;
			});
			$hiddenInput.change();
		}
		
		function alreadyExists(item) {
			var doesExist = false;
			$(token_items).each(function() {
				if(this == item) {
					doesExist = true;
					return false;
				}
			});
			
			return doesExist;
		}
		
		function removeTokenFromArray(item) {
			token_items = $.grep(token_items, function (a) { return a = item; });
			//console.log(token_items);
		}
		
		function token_add(token,allowCallback) {
			var shownTokens = [];
			var hiddenTokens = [];
			
			var $token = $("<span/>");
			var $tokenText = $("<span/>")
								.addClass('text')
								.text(token.label);
			var $img = $("<img/>");
			var $tokenImg = $("<span/>");
			var $hubPhoto = $("<div/>");
			var $input = $("<input/>").attr({
								type:'hidden',
								value:token.value,
								name:settings.fieldName + '_value',
								autocomplete:'off'
							   });
			
			
			var $clearer = $('<label/>').addClass('remove uiCloseButton');
			var $removeBtn = $('<input/>')
									.attr({ type:'button', title:'Remove' })
									.click(function() {
										token_delete($token,token);
									});
			var proceed = true;
			
			if (allowCallback) {
				proceed = settings.onSelect($token,token);
			}
			
			if(proceed) {
				switch (settings.type) {
					case 'token':
						$token
							.addClass('uiToken');
						
						$tokenText.appendTo($token);
					break;
					
					case 'tokenImage':
						$token
							.addClass('uiToken');
						
						$img.attr({
							width:settings.typeOpts.imgSize,
							height:settings.typeOpts.imgSize,
							src:token.image
						 });
						
						$tokenImg.addClass('tokenImg').appendTo($token);
						
						$hubPhoto.css({
								height:settings.typeOpts.imgSize + 'px',
								width:settings.typeOpts.imgSize + 'px'
								})
								.addClass('hubPhoto')
								.appendTo($tokenImg);
						
						$img.appendTo($hubPhoto);
						
						$tokenText.appendTo($token);
					break;
					
					case 'list':
						$token
							.addClass('uiListToken');
						$token.text(token.label);
						$clearer.appendTo($token);
						$removeBtn.appendTo($clearer);
						$input.appendTo($token);
						$token.wrapInner("<div class=\"name\"></div>");
					break;
					
					case 'listImage':
						
						$token
							.addClass('uiListToken');
						$img.attr({
							width:settings.typeOpts.imgSize,
							height:settings.typeOpts.imgSize,
							src:token.image
						 })
						.addClass('photo img');
						
						$token.text(token.label);
						
						$clearer.appendTo($token);
						$removeBtn.appendTo($clearer);
						$img.prependTo($token);
						$input.appendTo($token);
						$token.wrapInner("<div class=\"name\"></div>");
					break;
				}
			
				$tokenarea.addClass('expanded').removeClass('hide');
				
				$token.prependTo($tokenarea);
				
				token_items.push(token.value);
			}
			//console.log(token_items);
			/*
			$("<input/>").attr({
								type:'hidden',
								value:token.label,
								name:settings.fieldName + '_label',
								autocomplete:'off'
							   }).appendTo($token);*/
			
			/* BINDS */
			/*$token.click(function() {
				token_select($token);
				
				return false;
			 });*/
			
			//
			
			//refresh_binding($token);
			//refreshTokens();
			//refreshHiddenInput();
			
			return false;
		}
	}
	
	 $.uiTokenizer.defaults = {
			ajaxSearchParams:null,
			ajaxAddParams:null,
			ajaxParams:null,
			shownImages: true,
			shownCount: 5,
			listLocation:'bottom', /* top or bottom */
			defaultValue: [],
			watermarkText: "Type in a search term",
			searchDelay: 300,
			minChars: 1,
			ajaxMethod:'get',
			type:'token',
			tokenLimit: null,
			jsonContainer: null,
			method: "GET",
			tokenTmpl: '<span title="${label}" class="uiToken ${shown}">' +
					'        <span class="tokenImg hide">' +
					'            <div style="height: 62px; width: 62px;" class="hubPhoto">' +
					'                <img height="62" src="/static/images/no-photo/none_i.png" class="img">' +
					'            </div>' +
					'        </span>' +
					'        <span class="text">' +
					'            ${label}' +
					'        </span>' +
					'        <input type="hidden" value="${value}" name="${fieldName}" autocomplete="off">' +
					'        <input type="hidden" value="${label}" name="text_${fieldName}" autocomplete="off">' +
					'    </span>',
			contentType: "json",
			autocomplete:null,
			queryParam: "q",
			onResult: null,
			selectFirst: true,
			autoFill: false,
			defaultData:null,
			onRemove:function(item) { return true; },
			onSelect:function(item) { return true;  }
	};
	
	function log() {
		ce.log.info(arguments);
	};
});