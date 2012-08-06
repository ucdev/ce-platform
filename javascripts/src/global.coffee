ce.module "global", (self, ce, Backbone, Marionette, $, _) ->
  SubmitForm = (oForm) ->
    oForm.submit()
  getResources = ->
    getSprites()
  getSprites = ->
    resources = []
    if $("[class^=\"icon16-\"],[class*=\" icon16-\"]").length
      $("[class^=\"icon16-\"],[class*=\" icon16-\"]").each (i, val) ->
        classes = $(this).attr("class").split(" ")
        $(classes).each (i, val) ->
          
          #console.log(val);
          resources.push val  if val isnt ""


      resources = resources.unique().sort()
      $.ajax
        url: "/assets/sprites/"
        type: "post"
        data:
          images: resources

        success: (data) ->
          $("head").append "<link rel=\"stylesheet\" href=\"/stylesheets/sprites/" + $.trim(data) + ".css\" type=\"text/css\" />"

  
  # GLOBAL DOM READY
  
  # catch all ajax 
  
  #$("body").ajaxSuccess(function(ev,xhr) {
  #			var response = $.parseJSON(xhr.responseText);
  #			
  #			if(response.STATUSMSG == 'login_required') {
  #				
  #			}
  #		});
  
  # HISTORY OBJECT 
  historyList = (properties) ->
    
    # SET DEFAULT VALUES 
    $this = this
    settings = properties
    dataToSend =
      personfrom: 0
      personto: 0
      activityto: 0
      startrow: 1
      maxrows: 25

    
    #console.log(settings);
    $this.setMode = (mode) ->
      settings.mode = mode

    $this.setStartRow = (startrow) ->
      settings.data.startrow = startrow

    $this.setMaxRows = (maxrows) ->
      settings.data.maxrows = maxrows

    $this.getList = (clear, startTime, inject) ->
      inject = "append"  unless inject
      dataToSend =
        personfrom: 0
        personto: 0
        startrow: 1
        maxrows: 25
        starttime: startTime

		switch settings.mode
			when "activityTo"
				dataToSend.activityto = settings.data.activityto
			when "personTo"
				dataToSend.personto = settings.data.personto
			when "personFrom"
				dataToSend.personfrom = settings.data.personfrom
			when "personAll"
				dataToSend.personto = settings.data.personto
				dataToSend.personfrom = settings.data.personfrom
			when "all"
				dataToSend.startrow = settings.data.startrow
				dataToSend.maxrows = settings.data.maxrows

		settings.appendto.find(".history-item").remove()  if clear
		listHistory settings.appendto, dataToSend, inject
  
  # Takes an ISO time and returns a string representing how
  # long ago the date represents.
  prettyDate = (time) ->
    date = new Date((time or "").replace(/-/g, "/").replace(/[TZ]/g, " "))
    diff = (((new Date()).getTime() - date.getTime()) / 1000)
    day_diff = Math.floor(diff / 86400)
    return $.DateFormat(date, "mmm dd, yyyy")  if isNaN(day_diff) or day_diff < 0 or day_diff >= 31
    day_diff is 0 and (diff < 60 and "just now" or diff < 120 and "1 minute ago" or diff < 3600 and Math.floor(diff / 60) + " minutes ago" or diff < 7200 and "1 hour ago" or diff < 86400 and Math.floor(diff / 3600) + " hours ago") or day_diff is 1 and "Yesterday" or day_diff < 7 and day_diff + " days ago" or day_diff < 31 and Math.ceil(day_diff / 7) + " weeks ago"
  
  # If jQuery is included in the page, adds a jQuery plugin to handle it as well
  listHistory = (appendTo, params, inject) ->
    output = ""
    $.ajax
      url: "/admin/_com/ajax_history.cfc?method=list"
      dataType: "json"
      type: "GET"
      data: params
      success: (data, textStatus, XMLHttpRequest) ->
        
        #console.log(data);
        $.each data.DATASET, (i, item) ->
          $historyitem = ""
          if inject is "append"
            appendTo.append renderHistoryItem(item)
            $historyitem = $("#history-item-" + item.HISTORYID)
            $historyitem.show()
          else if inject is "prepend"
            appendTo.prepend renderHistoryItem(item)
            $historyitem = $("#history-item-" + item.HISTORYID)
            $historyitem.fadeIn()
          $historyitem.find(".history-meta a").prettyDate()
          $historyitem.find(".prettydate").prettyDate()
          setInterval (->
            $historyitem.find(".history-meta a").prettyDate()
          ), 5000
          setInterval (->
            $historyitem.find(".prettydate").prettyDate()
          ), 5000


  
  #appendTo.find(".history-meta a").text();
  renderHistoryItem = (row) ->
    re = /%[A-Za-z]+%/g
    ReturnContent = row.TEMPLATEFROM
    aFoundFields = ReturnContent.match(re)
    sOutput = ""
    ToContent = ""
    $.each aFoundFields, (i, item) ->
      ReturnContent = ReturnContent.replace(item, item.toUpperCase())
      VarName = $.trim($.Replace(item, "%", "", "ALL")).toUpperCase()
      
      #console.log(item + " = " + VarName + " = " + eval("row." + VarName));
      #console.log(VarName);
      ReturnContent = $.Replace(ReturnContent, VarName, eval_("row." + VarName.toUpperCase()), "ALL")

    
    #console.log(ReturnContent);
    ToContent = $.Replace(row.TOCONTENT, "/index.cfm/event/", sMyself, "ALL")
    $item = $("<div/>").addClass("uiStoryItem").attr(id: "uiStoryItem-" + row.HISTORYID)
    sOutput = "<div class=\"history-item clearfix\" id=\"history-item-" + row.HISTORYID + "\" style=\"display:none;\">" + "<div class=\"history-line clearfix\"><a class=\"uiImage-i\" href=\"/person/general?personId=" + row.FROMPERSONID + "\"><img src=\"" + row.FROMPERSONIMAGE + "\" border=\"0\" /></a>" + ReturnContent + "</div>"
    sOutput = sOutput + "<div class=\"mvm plm history-subbox\">" + ToContent + "<div style=\"clear:both;\"></div>" + "</div>"  if ToContent
    sOutput = sOutput + "<div class=\"history-meta\"><a title=\"" + row.CREATED + "\">" + row.CREATED + "</a></div>" + "</div>"
    sOutput = $.Replace(sOutput, "%", "", "ALL")
    sOutput
  StatusCount = 0
  $ ->
    getResources()
    $("input").keydown (e) ->
      if e.keyCode is 13
        $(this).parents("form").submit()
        false

    $(".dialogLink").on "click", (e) ->
      $this = $(this)
      $href = $this.attr("href")
      $options = $this.attr("data-options")
      $settings = open: (event, ui) ->
        $.ajax url: $href

      $.dialog $options


  Array::unique = ->
    arrVal = this
    uniqueArr = []
    i = arrVal.length

    while i--
      val = arrVal[i]
      uniqueArr.unshift val  if $.inArray(val, uniqueArr) is -1
    uniqueArr

  unless typeof jQuery is "undefined"
    jQuery.fn.prettyDate = ->
      @each ->
        date = prettyDate(@title)
        jQuery(this).text date  if date

  $ ->
    $("input").keydown (e) ->
      if e.keyCode is 13
        $(this).parents("form").submit()
        false

    
    #if(loggedIn) {
    #			startDefibrillator();	
    #		}
    $("input.DatePicker").mask "99/99/9999"
    $("#date1").mask "99/99/9999"
    $("#date2").mask "99/99/9999"
    $("#date3").mask "99/99/9999"
    $("#date4").mask "99/99/9999"
    $("#date5").mask "99/99/9999"
    $("#date6").mask "99/99/9999"
    $("#date7").mask "99/99/9999"
    $("#date8").mask "99/99/9999"
    $("#date9").mask "99/99/9999"
    $("#date10").mask "99/99/9999"
    $("#date11").mask "99/99/9999"
    $("#date12").mask "99/99/9999"
    $(".AppDate").mask "99/99/9999"
    $("#phone1").mask "(999) 999-9999"
    $("#phone2").mask "(999) 999-9999"
    $("#phone3").mask "(999) 999-9999"
    $("#phone4").mask "(999) 999-9999"
    $("#phone5").mask "(999) 999-9999"
    $("#phone6").mask "(999) 999-9999"
    $("#phone7").mask "(999) 999-9999"
    $("#phone8").mask "(999) 999-9999"
    $("#fax1").mask "(999) 999-9999"
    $("#fax2").mask "(999) 999-9999"
    $("#tin").mask "99-9999999"
    $("#ssn").mask "9999"
    $(".control-label").each (i, val) ->
      text = $(val).text()
      newText = text + ":"
      $(val).text newText




#UTIL = {
#		exec: function( controller, action ) {
#		var ns = SITENAME,
#		action = ( action === undefined ) ? "init" : action;
#		 
#		if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {ns[controller][action]();}
#		},
#		 
#		init: function() {
#		var body = document.body,
#		controller = body.getAttribute( "data-controller" ),
#		action = body.getAttribute( "data-action" );
#		 
#		UTIL.exec( "common" );
#		UTIL.exec( controller );
#		UTIL.exec( controller, action );
#	}
#	};
#	 
#	$( document ).ready( UTIL.init );