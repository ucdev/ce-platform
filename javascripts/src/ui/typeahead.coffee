ce.module "ui.typeahead", (self, ce, Backbone, Marionette, $, _) ->
  
  # CEAuth - Form Field: Typeahead (kind of a combobox without predefined items)
  
  # INITIAL SETTINGS / HTML INJECTION 
  
  # METHOD CALLS 
  
  # TYPEAHEAD - Internal core logic 
  
  #log(input);
  #        log(settings);
  
  # ORIGINAL INPUT - hidden
  
  # NEW INPUT ELEMENT
  
  #hide_dropdown();
  
  # TOKENIZER WRAPPER - contains all elements for this instance of the tokenizer
  
  # AUTOCOMPLETE container element
  
  # AUTOCOMPLETE (requires jQuery UI autocomplete widget
  
  #define callback to format results
  
  #create array for response objects
  
  #process response
  
  #pass array to callback
  
  #console.log(suggestions);
  #startTypingTimer($input);
  
  #define select handler
  
  #define select handler
  
  #prevent 'to' field being updated and correct position
  #$input.val("").css("top", 2);
  
  #disable click
  
  #log("autocomplete plugin is installed.");
  
  # INJECT ALL OF THE HTML INTO THE PAGE
  
  # if you want to use watermarkText then JQUERY.WATERMARK PLUGIN NEEDED
  
  #log("watermark plugin is installed.");
  
  #console.log(items);
  
  #console.log(typeItems);
  
  #console.log($(typeItems).slice(itemsPerType));
  
  #data.image = "/static/images/no-photo/" +  + "_i.png";
  
  #settings.onAdd(item);
  log = ->
    ce.log.info arguments_
  methods =
    init: (options) ->
      settings = $.extend({}, $.uiTypeahead.defaults, options)
      @each ->
        typeahead = new $.uiTypeahead(this, settings)


    reset: ->
      $.uiTypeahead.clear this

  $.fn.uiTypeahead = (method) ->
    if methods[method]
      methods[method].apply this, Array::slice.call(arguments_, 1)
    else if typeof method is "object" or not method
      methods.init.apply this, arguments_
    else
      $.error "Method " + method + " does not exist on uiTypeahead"

  $.uiTypeahead = (input, settings) ->
    load_default = ->
      if settings.defaultValue
        $.ajax
          url: settings.ajaxSearchURL
          type: settings.ajaxSearchType
          dataType: "json"
          data:
            key: settings.defaultValue

          success: (data) ->
            hub = data.PAYLOAD
            item_select hub

    item_focus = (item) ->
    search_resizer = ->
      items = $(".uiSearchInput ul li")
      $(curr_types).each ->
        typeItems = items.filter("." + this)
        $(typeItems).slice(0, itemsPerType - 1).show()
        $(typeItems).slice(itemsPerType).hide()

    alreadyExists = (value) ->
      doesExist = false
      $(settings.excludeItems).each ->
        if this is value
          doesExist = true
          false

      doesExist
    resize_math = ->
      totalHeight = (currTotalResults * heightEach) + (currTotalTypes * headerHeight) + 39
      heightEachReal = totalHeight / currTotalResults
      maxItems = $(window).height() / heightEachReal
      itemsPerType = Math.floor(maxItems / currTotalTypes)  if currTotalTypes
    item_add = (name, method) ->
      $.ajax
        url: settings.ajaxAddURL
        type: settings.ajaxAddType
        dataType: "json"
        async: false
        data: $.extend(settings.ajaxAddParams,
          name: name
        )
        success: (returnData) ->
          data = returnData.PAYLOAD
          data.label = data.TEXT
          data.value = data.ITEM_ID
          item_select data
          true

    item_select = (item) ->
      unless item.value is 0
        unless settings.clearOnSelect
          $hiddenInput.val item.value.toString()
          $hiddenInput.keyup()
          $input.val item.label
          $img.attr "src", item.image
          $wrap.addClass "selected"
          $hiddenInput.keyup()
          settings.onSelect item
          settings.excludeItems.push item.value
        else
          settings.onSelect item
          clear_typeahead()
      else
        item_add $input.val(), settings.ajaxSearchParams.method  if settings.allowAdd
    item_deselect = ->
      $hiddenInput.val ""
      $input.focus()
      $wrap.removeClass "selected"
    set_image = (item) ->
      $img
    clear_typeahead = ->
      $hiddenInput.val ""
      $input.val ""
      $input.focus()
      $wrap.removeClass "selected"
    get_wikiImage = (item) ->
      $.ajax
        url: "/admin/_com/ajax/typeahead.cfc"
        type: "get"
        data:
          method: "wikipedia_image"
          q: item.label

        success: (data) ->
          $img.attr "src", $.trim(data)

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

    searchTypes = 3
    resultsPerType = 4
    maxResults = searchTypes * resultsPerType
    heightEach = 68
    headerHeight = 18
    currTotalResults = 0
    currTotalTypes = 0
    curr_types = []
    maxItems = $(window).height() / heightEach
    itemsPerType = 4
    totalHeight = (currTotalResults * heightEach) + (currTotalTypes * headerHeight) + 39
    heightEachReal = totalHeight / maxResults
    if settings.bucketed
      $(window).resize ->
        resize_math()
        search_resizer()

    $hiddenInput = $(input).addClass("hide").focus(->
    ).blur(->
      $input.blur()
    )
    fieldName = $hiddenInput.attr("name")
    origWidth = $hiddenInput.width()
    $hiddenInput.has(".hide")
    $input = $("<input/>").attr(
      type: "text"
      autocomplete: "off"
      spellcheck: false
    ).addClass("inputtext textInput").click(->
      $input.autocomplete("widget").show()  if $(this).val().length > 0 and $hiddenInput.val().length is 0
    ).blur(->
    ).keydown((event) ->
      previous_token = undefined
      next_token = undefined
      switch event.keyCode
        when KEY.LEFT, KEY.RIGHT
      , KEY.UP
      , KEY.DOWN
      , KEY.BACKSPACE
          item_deselect()
        when KEY.TAB, KEY.RETURN
      , KEY.COMMA
      , KEY.ESC
          true
    )
    $typeahead = $("<div/>").addClass("uiTypeahead").addClass(settings.typeaheadClass)
    $wrap = $("<div/>").addClass("wrap").appendTo($typeahead).on("click", (ev) ->
      $input.focus()
    )
    $img = $("<img/>")
    if settings.showImage
      $typeahead.addClass "imageTypeahead"
      $img.addClass("photo img").appendTo $wrap
    if settings.clearable
      $typeahead.addClass "uiClearableTypeahead"
      $clearer = $("<label/>").addClass("clear uiCloseButton icon-close").prependTo($wrap).click(->
        clear_typeahead()
      )
      $removeBtn = $("<a class=\"close\" data-dismiss=\"modal\"></a>").attr(title: "Remove").appendTo($clearer)
    $input.appendTo $wrap
    $typeaheadView = $("<div/>").addClass("uiTypeaheadView").appendTo($typeahead)
    if $.isFunction($.fn.autocomplete)
      $input.autocomplete(
        selectFirst: true
        appendTo: ($typeaheadView)
        source: (req, add) ->
          if $.trim(req.term).length
            $.ajax
              url: settings.ajaxSearchURL
              type: settings.ajaxSearchType
              dataType: "json"
              data: $.extend({}, settings.ajaxSearchParams,
                q: req.term
              )
              success: (data) ->
                suggestions = []
                curr_type = ""
                curr_type_friendly = ""
                payload = data.PAYLOAD
                currTotalResults = 0
                currTotalTypes = 0
                $.each payload, (i, val) ->
                  anItem = payload[i]
                  currTotalResults++
                  anItem.label = anItem.label.substr(0, 67) + "..."  if anItem.label.length > 70
                  anItem.callToAction = false
                  anItem.ignored = false
                  suggestions.push anItem

                if settings.allowViewMore
                  anItem =
                    label: "See more results for &quot;" + $input.val() + "&quot;"
                    value: 0
                    image: ""
                    subText1: ""
                    subText2: ""
                    image: ""
                    ignored: false
                    callToAction: true

                  suggestions.push anItem
                if settings.allowAdd
                  anItem =
                    label: "Add &quot;" + $input.val() + "&quot;"
                    value: 0
                    subText1: ""
                    subText2: ""
                    image: ""
                    ignored: false
                    callToAction: true

                  suggestions.push anItem
                $(this).data "suggestions", suggestions
                add suggestions


        focus: (e, ui) ->
          false

        delay: 200
        search: (e, ui) ->
          item_deselect()

        select: (e, ui) ->
          item_select ui.item
          false

        change: ->
          false
      ).data("autocomplete")._renderMenu = (ul, items) ->
        $(ul).addClass settings.size
        resize_math()  if settings.bucketed
        $.each items, (index, item) ->
          subtext1 = $("<span/>").addClass("subtext").text(item.subText1)
          subtext2 = $("<span/>").addClass("subtext").text(item.subText2)
          li = $("<li></li>").data("item.autocomplete", item).appendTo(ul)
          label = $("<a></a>").html("<div>" + item.label + "</div>").appendTo(li)
          img = $("<img/>").attr(src: item.image).prependTo(label)
          if item.ignored
            label.click ->
              false

          label.append subtext1  if item.subText1
          label.append subtext2  if item.subText2
          li.addClass "ignore"  if item.ignored
          img.remove()  if item.isHeader
          if item.callToAction
            img.remove()
            li.addClass "calltoaction"

        search_resizer()  if settings.bucketed
    $typeahead.insertAfter $hiddenInput
    $typeahead.prependTo settings.appendTo  if settings.appendTo
    $input.watermark settings.watermarkText  if jQuery.watermark
    load_default()
    $(this).data "hiddenInput", $hiddenInput
    $(this).data "input", $input
    $(this).data "typeahead", $input
    $(this).data "wrap", $input
    $input

  $.uiTypeahead.clear = ->

  $.uiTypeahead.defaults =
    ajaxSearchParams: null
    ajaxAddParams: null
    showImage: true
    allowAdd: true
    allowViewMore: false
    excludeItems: []
    clearable: true
    appendTo: null
    useExistingInput: false
    clearOnSelect: false
    allowAdd: true
    size: "compact"
    bucketed: false
    shownCount: 5
    watermarkText: "Type in a search term"
    width: 384
    typeaheadClass: ""
    minChars: 1
    ajaxMethod: "get"
    type: "token"
    tokenLimit: null
    jsonContainer: null
    method: "GET"
    contentType: "json"
    autocomplete: null
    queryParam: "q"
    onResult: null
    selectFirst: true
    autoFill: false
    defaultValue: null
    onAdd: (item) ->
      true

    onSelect: (item) ->
      true


#var typingTimeout;
#	function startTypingTimer(input_field)
#	{	
#		if (typingTimeout != undefined) 
#			clearTimeout(typingTimeout);
#		typingTimeout = setTimeout( function()
#					{				
#						eval(input_field.attr("onfinishinput"));
#					}
#		, 500);
#	}