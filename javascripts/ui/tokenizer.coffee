ce.module "ui.tokenizer", (self, ce, Backbone, Marionette, $, _) ->
  
  # CEAuth - Form Field: Tokenizer Input
  
  # INITIAL SETTINGS / HTML INJECTION 
  
  # METHOD CALLS 
  
  # TOKENIZE - Internal core logic 
  
  #log(input);
  #		log(settings);
  
  # storage variables
  
  # ORIGINAL INPUT - hidden
  
  # TOKENIZER WRAPPER - contains all elements for this instance of the tokenizer
  
  # TOKEN AREA - contains all of your tokens
  
  # INJECT ALL OF THE HTML INTO THE PAGE
  
  # AUTOCOMPLETE (requires jQuery UI autocomplete widget
  # array or single value 
  
  #console.log(token_items);
  
  #        marginOffset = parseInt($(token).height() * clickOffset.y);
  #if($(token).hasClass('drag')) {
  #							$(token).css({
  #								'margin-top':'auto'
  #							});
  #						} else {
  #							$(token).css({
  #								'margin-top':'auto'
  #							});
  #						}
  #						console.log(marginOffset);
  
  #console.log('drag');
  # 0-1a-z
  # numpad 0-9 + - / * .
  # ; = , - . / ^
  # ( \ ) '
  
  #console.log($tokenarea.children('.uiToken').not('.droppable_placeholder'));
  
  #placeholder.insertBefore($(this));
  
  #console.log(startOffset);
  
  #if(dd.drop[0]) {
  #					$("#stats-container").html('<div>' + $(dd.drop[0]).find('.text').text() + '</div>');
  #				} else {
  #					$("#stats-container").html('<div>' + $(this).find('.text').text() + '</div>');
  #				}
  
  #console.log(drop);
  
  #$( this )[ method ]( drop );
  
  #$("#stats-container").html('<div>drop: ' + $(drop).find('.text').text() + '</div>' +
  #												   '<div>item: ' + $(this).find('.text').text() + '</div>');
  
  #placeholder.insertBefore($(this));
  
  #placeholder.insertAfter($(this));
  
  #if(currWidth < startWidth) {
  #					left = parseFloat(left) + parseFloat(testX)*clickOffset.x;
  #					//console.log(testX);
  #				}
  #				
  #				if(currHeight < startHeight) {
  #					top = parseFloat(top) + parseFloat(testY);
  #					//console.log(top);
  #				}
  
  #refreshHiddenInput();
  
  #$(document).keydown(function(e) {
  #				if($token.hasClass('uiTokenSelected')) {
  #					switch(e.keyCode) {
  #						case KEY.LEFT:
  #							if($prevToken.is('.uiToken')) {
  #								token_deselect($token);
  #								$(document).unbind("keydown");
  #								token_select($prevToken);
  #							}
  #							break;
  #						case KEY.RIGHT:
  #							if($nextToken.is('.uiToken')) {
  #								token_deselect($token);
  #								$(document).unbind("keydown");
  #								token_select($nextToken);
  #							}
  #							break;
  #						case KEY.TAB:
  #							if(e.shiftKey) {
  #								if($prevToken.is('.uiToken')) {
  #								token_deselect($token);
  #								$(document).unbind("keydown");
  #								token_select($prevToken);
  #							}
  #							} else {
  #								if($nextToken.is('.uiToken')) {
  #									token_deselect($token);
  #									$(document).unbind("keydown");
  #									token_select($nextToken);
  #								}
  #							}
  #							break;
  #						case KEY.BACKSPACE:
  #							token_delete($token);
  #							$(document).unbind("keydown");
  #							
  #							refreshTokens();
  #							token_select($nextToken);
  #							break;
  #						case KEY.DELETE:
  #							token_delete($token);
  #							$(document).unbind("keydown");
  #							
  #							refreshTokens();
  #							token_select($nextToken);
  #							break;
  #						
  #		
  #						case KEY.ESC:
  #							token_deselect($token);
  #							$(document).unbind("keydown");
  #						break;
  #					}
  #				}
  #				return false;
  #			});
  
  #console.log(token_items);
  
  #console.log(token_items);
  #
  #			$("<input/>").attr({
  #								type:'hidden',
  #								value:token.label,
  #								name:settings.fieldName + '_label',
  #								autocomplete:'off'
  #							   }).appendTo($token);
  
  # BINDS 
  
  #$token.click(function() {
  #				token_select($token);
  #				
  #				return false;
  #			 });
  
  #
  
  #refresh_binding($token);
  #refreshTokens();
  #refreshHiddenInput();
  # top or bottom 
  log = ->
    ce.log.info arguments_
  methods = init: (options) ->
    settings = $.extend({}, $.uiTokenizer.defaults, options)
    @each ->
      new $.uiTokenizer(this, settings)


  $.fn.uiTokenizer = (method) ->
    if methods[method]
      methods[method].apply this, Array::slice.call(arguments_, 1)
    else if typeof method is "object" or not method
      methods.init.apply this, arguments_
    else
      $.error "Method " + method + " does not exist on uiTokenizer"

  $.uiTokenizer = (input, settings) ->
    makeDragShown = (ui) ->
      ui.item.addClass("shown").removeClass("hidden").find(".tokenImg").show()
      ui.placeholder.addClass("shown shownPlaceholder").css(
        height: 102
        width: 72
      ).removeClass("hidden hiddenPlaceholder").find(".tokenImg").show()
      ui.helper.addClass("shown shownPlaceholder").css(
        height: 102
        width: 72
      ).removeClass("hidden hiddenPlaceholder").find(".tokenImg").show()
    makeDragHidden = (ui) ->
      ui.item.removeClass("shown").addClass("hidden").find(".tokenImg").hide()
      ui.placeholder.removeClass("shown shownPlaceholder").css(
        height: 16
        width: 72
      ).addClass("hidden hiddenPlaceholder").find(".tokenImg").hide()
      ui.helper.removeClass("shown shownPlaceholder").css(
        height: 16
        width: 72
      ).addClass("hidden hiddenPlaceholder").find(".tokenImg").hide()
    makeTokenShown = (token) ->
      token.addClass("shown").removeClass("hidden").find(".tokenImg").show()
      token.hasClass("drag")
    makeTokenHidden = (token) ->
      token.removeClass("shown").addClass("hidden").find(".tokenImg").hide()
    is_printable_character = (keycode) ->
      if (keycode >= 48 and keycode <= 90) or (keycode >= 96 and keycode <= 111) or (keycode >= 186 and keycode <= 192) or (keycode >= 219 and keycode <= 222)
        true
      else
        false
    load_default = ->
      list_items = settings.defaultValue
      token = {}
      $(list_items).each ->
        token_add this, false

    typeahead_select = (token) ->
      token_add token
      $input.val ""
      $input.blur()
    refresh_binding = (token) ->
      unless token
        tokens = $tokenarea.children(".uiToken").not(".droppable_placeholder")
      else
        tokens = token
      tokens.drag "init", (ev, dd) ->
        placeholder = $("<span/>").addClass("uiToken droppable_placeholder")
        siblings = $(this).siblings(".uiToken")
        $(this).data "placeholder", placeholder

      tokens.drag("start", (ev, dd) ->
        placeholder = $(this).data("placeholder")
        startIndex = $(this).index()
        startHeight = $(this).height()
        startWidth = $(this).width()
        siblings = $(this).data("siblings")
        $(this).data "startIndex", startIndex
        $(this).data "startHeight", startHeight
        $(this).data "startWidth", startWidth
        clickOffset =
          x: parseInt(ev.pageX - dd.originalX) / 100
          y: parseInt(ev.pageY - dd.originalY) / 100

        $(this).data "clickOffset", clickOffset
        startOffset = $(this).height() * clickOffset.y
        $(this).data "startOffset", startOffset
        container = $tokenarea.offset()
        $(this).addClass "drag"
        $(this).css "z-index": "1000"
      ).drag((ev, dd) ->
        placeholder = $(this).data("placeholder")
        clickOffset = $(this).data("clickOffset")
        startOffset = $(this).data("startOffset")
        startHeight = $(this).data("startHeight")
        startWidth = $(this).data("startWidth")
        startIndex = $(this).data("startIndex")
        container = $tokenarea.offset()
        rel =
          y: parseInt(ev.pageY - container.top)
          x: parseInt(ev.pageX - container.left)

        top = rel.y
        left = rel.x
        drop = dd.drop[0]
        method = $.data(drop or {}, "drop+reorder")
        if $(drop).parents().filter($tokenarea).length > 0
          $("#stat-container").html "<div>" + $(drop).text() + "</div>"
          if drop and $(drop).is(".uiToken") and (drop isnt dd.current or method isnt dd.method)
            $(this).insertBefore drop
            dd.current = drop
            dd.method = method
            dd.update()
            refreshTokens clickOffset
        else

        if settings.type is "tokenImage"
          if $(this).index() > 4
            placeholder.addClass("hidden hiddenPlaceholder").removeClass("shown shownPlaceholder").css
              height: $(this).height()
              width: $(this).width()

          else
            placeholder.addClass("shown shownPlaceholder").removeClass("hidden hiddenPlaceholder").css height: $(this).height()
        else
          placeholder.removeClass("shown shownPlaceholder").removeClass("hidden hiddenPlaceholder").css
            height: $(this).height()
            width: $(this).width()

        currHeight = $(this).height()
        currWidth = $(this).width()
        currHeightOffset = (currHeight * clickOffset.y)
        testY = parseFloat(ev.pageY - dd.offsetY) - parseFloat(currHeightOffset)
        currWidthOffset = (currWidth * clickOffset.x)
        testX = parseFloat(ev.pageX - dd.offsetX) - parseFloat(currWidthOffset)
        $(this).css
          position: "relative"
          "z-index": "1000"
          top: 0
          left: 0

      ,
        relative: true
      ).drag("end", (ev, dd) ->
        placeholder = $(this).data("placeholder")
        startIndex = $(this).data("startIndex")
        container = $tokenarea.offset()
        placeholder.remove()
        refreshHiddenInput()  unless startIndex is $(this).index()
        $(this).css
          position: "relative"
          "z-index": "0"
          top: 0
          left: 0
          "margin-top": "auto"

        $(this).removeClass "drag"
      ).drop "init", (ev, dd) ->
        (this isnt dd.drag)

    token_delete = ($token, item) ->
      override = settings.onRemove($token, item)
      if override
        removeTokenFromArray item.value
        $token.remove()
    token_deselect = ($token) ->
      $token.removeClass("uiTokenSelected").removeClass "uiTokenShownSelected"
      false
    token_select = ($token) ->
      $nextToken = $token.next()
      $prevToken = $token.prev()
      $token.addClass "uiTokenSelected"
      $token.addClass "uiTokenShownSelected"  if $token.hasClass("shown")
      $("body").click()
      $("html").one "click", ->
        token_deselect $token
        false

      false
    refreshHiddenInput = ->
      tokenLabels = $("[name=\"" + fieldName + "_label\"]").serializeArray()
      tokenValues = $("[name=\"" + fieldName + "_value\"]").serializeArray()
      counter = 0
      $hiddenInput.html("").val ""
      $(tokenLabels).each ->
        option = $("<option/>").val(tokenValues[counter].value).attr("selected", true).appendTo($hiddenInput).text(tokenLabels[counter].value)
        counter++

      $hiddenInput.change()
    alreadyExists = (item) ->
      doesExist = false
      $(token_items).each ->
        if this is item
          doesExist = true
          false

      doesExist
    removeTokenFromArray = (item) ->
      token_items = $.grep(token_items, (a) ->
        a = item
      )
    token_add = (token, allowCallback) ->
      shownTokens = []
      hiddenTokens = []
      $token = $("<span/>")
      $tokenText = $("<span/>").addClass("text").text(token.label)
      $img = $("<img/>")
      $tokenImg = $("<span/>")
      $hubPhoto = $("<div/>")
      $input = $("<input/>").attr(
        type: "hidden"
        value: token.value
        name: settings.fieldName + "_value"
        autocomplete: "off"
      )
      $clearer = $("<label/>").addClass("remove uiCloseButton")
      $removeBtn = $("<input/>").attr(
        type: "button"
        title: "Remove"
      ).click(->
        token_delete $token, token
      )
      proceed = true
      proceed = settings.onSelect($token, token)  if allowCallback
      if proceed
        switch settings.type
          when "token"
            $token.addClass "uiToken"
            $tokenText.appendTo $token
          when "tokenImage"
            $token.addClass "uiToken"
            $img.attr
              width: settings.typeOpts.imgSize
              height: settings.typeOpts.imgSize
              src: token.image

            $tokenImg.addClass("tokenImg").appendTo $token
            $hubPhoto.css(
              height: settings.typeOpts.imgSize + "px"
              width: settings.typeOpts.imgSize + "px"
            ).addClass("hubPhoto").appendTo $tokenImg
            $img.appendTo $hubPhoto
            $tokenText.appendTo $token
          when "list"
            $token.addClass "uiListToken"
            $token.text token.label
            $clearer.appendTo $token
            $removeBtn.appendTo $clearer
            $input.appendTo $token
            $token.wrapInner "<div class=\"name\"></div>"
          when "listImage"
            $token.addClass "uiListToken"
            $img.attr(
              width: settings.typeOpts.imgSize
              height: settings.typeOpts.imgSize
              src: token.image
            ).addClass "photo img"
            $token.text token.label
            $clearer.appendTo $token
            $removeBtn.appendTo $clearer
            $img.prependTo $token
            $input.appendTo $token
            $token.wrapInner "<div class=\"name\"></div>"
        $tokenarea.addClass("expanded").removeClass "hide"
        $token.prependTo $tokenarea
        token_items.push token.value
      false
    KEY =
      BACKSPACE: 8
      TAB: 9
      RETURN: 13
      ESC: 27
      LEFT: 37
      UP: 38
      RIGHT: 39
      DOWN: 40
      COMMA: 188
      ENTER: 13
      DELETE: 46

    token_items = []
    $hiddenInput = $(input).hide().focus(->
    ).blur(->
      $input.blur()
    )
    fieldName = $hiddenInput.attr("name")
    $wrapper = $("<div/>").addClass("uiTokenizer mrl")
    switch settings.type
      when "token"
        settings.typeOpts =
          imgSize: 0
          dragOffset:
            top: -10
            left: -30
      when "tokenImage"
        settings.typeOpts =
          imgSize: 62
          dragOffset:
            top: 23
            left: 30

        $wrapper.addClass "uiImageTokenizer"
      when "list"
        settings.typeOpts =
          imgSize: 0
          dragOffset:
            top: -10
            left: 40

        $wrapper.addClass "uiListTokenizer"
      when "listImage"
        settings.typeOpts =
          imgSize: 16
          dragOffset:
            top: -10
            left: 40

        $wrapper.addClass "uiListImageTokenizer"
    $tokenarea = $("<div/>").addClass("uiTokenarea hide clearfix")
    $wrapper.insertAfter $hiddenInput
    $hiddenInput.uiTypeahead
      watermarkText: settings.watermarkText
      defaultValue: null
      queryParam: "q"
      appendTo: $wrapper
      clearOnSelect: true
      ajaxSearchURL: settings.ajaxSearchURL
      ajaxSearchType: settings.ajaxSearchType
      ajaxSearchParams: settings.ajaxSearchParams
      ajaxAddURL: settings.ajaxAddURL
      ajaxAddType: settings.ajaxAddType
      ajaxAddParams: settings.ajaxAddParams
      onSelect: (item) ->
        token_add item, true  unless $.inArray(item.value, token_items) >= 0
        false

    if settings.listLocation is "top"
      $tokenarea.prependTo $wrapper
    else
      $tokenarea.appendTo $wrapper
    refreshTokens = (clickOffset) ->
      counter = 0
      tokens = $tokenarea.children(".uiToken").not(".droppable_placeholder")
      unless clickOffset
        clickOffset =
          x: 0
          y: 0
      if settings.type is "tokenImage"
        textAll = ""
        tokens.each ->
          token = $(this)
          index = token.index()
          text = token.find(".text").text()
          textAll = textAll + ", " + text
          if counter < 5
            makeTokenShown token
          else
            makeTokenHidden token
          counter++


    load_default()

  $.uiTokenizer.defaults =
    ajaxSearchParams: null
    ajaxAddParams: null
    ajaxParams: null
    shownImages: true
    shownCount: 5
    listLocation: "bottom"
    defaultValue: []
    watermarkText: "Type in a search term"
    searchDelay: 300
    minChars: 1
    ajaxMethod: "get"
    type: "token"
    tokenLimit: null
    jsonContainer: null
    method: "GET"
    tokenTmpl: "<span title=\"${label}\" class=\"uiToken ${shown}\">" + "        <span class=\"tokenImg hide\">" + "            <div style=\"height: 62px; width: 62px;\" class=\"hubPhoto\">" + "                <img height=\"62\" src=\"/static/images/no-photo/none_i.png\" class=\"img\">" + "            </div>" + "        </span>" + "        <span class=\"text\">" + "            ${label}" + "        </span>" + "        <input type=\"hidden\" value=\"${value}\" name=\"${fieldName}\" autocomplete=\"off\">" + "        <input type=\"hidden\" value=\"${label}\" name=\"text_${fieldName}\" autocomplete=\"off\">" + "    </span>"
    contentType: "json"
    autocomplete: null
    queryParam: "q"
    onResult: null
    selectFirst: true
    autoFill: false
    defaultData: null
    onRemove: (item) ->
      true

    onSelect: (item) ->
      true
