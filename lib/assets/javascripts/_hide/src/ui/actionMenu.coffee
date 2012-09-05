ce.module "ui.actionMenu", (self, ce, Backbone, Marionette, $, _) ->
  defineVars = (oRecord) ->
    oPerson = new Object()
    oPerson.oLink = $(oRecord)
    oPerson.oPersonRow = oPerson.oLink.parents(".AllAttendees")
    oPerson.nAttendee = oPerson.oPersonRow.find(".personId").val()
    oPerson.nPerson = oPerson.oPersonRow.find(".personId").val()
    oPerson.nAttendee = oPerson.oPersonRow.find(".attendeeId").val()
    oPerson.sAction = oPerson.oLink.parent().attr("class")
    sPersonNameTemp = oPerson.oPersonRow.find(".PersonLink").html()
    oPerson.sPersonName = $.Trim($.ListGetAt(sPersonNameTemp, 2, ",")) + " " + $.Trim($.ListGetAt(sPersonNameTemp, 1, ","))
    oPerson
  $.fn.isPerson = ->
    @each ->
      oPersonRow = $(this)
      oPersonActionMenu = oPersonRow.find(".action-menu button").isPersonActionMenu()


  $.fn.isPersonActionLink = ->
    @each ->
      $(this).click (J) ->
        oPerson = defineVars(this)
        switch oPerson.sAction
          when "assess"
            $.post "/Activity/AttendeeDetailAHAH",
              ActivityID: nActivity
              PersonID: oPerson.nPerson
              AttendeeID: oPerson.nAttendee
            , (data) ->
              $("#PersonDetailContent").html data

            # custom top position 
            # custom left position
            # some expose tweaks suitable for facebox-looking dialogs
            # you might also consider a "transparent" color for the mask 
            # load mask a little faster
            # highly transparent 
            # disable this for modal dialog-type of overlays 
            # we want to use the programming API 
            $("#PersonDetailContainer").overlay(
              top: 100
              left: 50
              expose:
                color: "#333"
                loadSpeed: 200
                opacity: 0.9

              closeOnClick: false
              onClose: ->
                updateRegistrants nId
                $("#PersonDetailContent").html ""

              api: true
            ).load()
          when "pifform"
            
            # REMOVED TO PREVENT PULLING UP PREVIOUS PERSON's DATA
            $.post sMyself + "/Activity/AttendeeCDC",
              ActivityID: nActivity
              PersonID: oPerson.nPerson
              AttendeeID: oPerson.nAttendee
            , (data) ->
              $("#pifForm").html data

            
            # PIF DIALOG
            $("#pifDialog").dialog
              title: "PIF Form"
              modal: true
              autoOpen: false
              position: [40, 40]
              height: 450
              width: 750
              resizable: true
              dragStop: (ev, ui) ->

              buttons:
                Save: ->
                  $("#frmCDC").ajaxSubmit()
                  addMessage "PIF successfully updated.", 250, 6000, 4000
                  $(this).dialog "close"

                Cancel: ->
                  $(this).dialog "close"

              overlay:
                opacity: 0.5
                background: "black"

              close: ->
                $("#pifForm").html ""

              resizeStop: (ev, ui) ->
                $("#pifForm").css "height", ui.size.height - 73 + "px"

            
            # OPEN PIF DIALOG
            $("#pifDialog").dialog "open"
          when "eCMECert"
            $.post "/Activity/emailCert",
              ActivityID: nActivity
              PersonID: oPerson.nPerson
              AttendeeID: oPerson.nAttendee
            , (data) ->
              $("#email-cert-dialog").html data

            
            # EMAIL CERT DIALOG
            $("#email-cert-dialog").dialog
              title: "Email Certificate"
              modal: true
              autoOpen: true
              height: 300
              width: 400
              resizable: false
              overlay:
                opacity: 0.5
                background: "black"

              buttons:
                Save: ->
                  $("#frmEmailCert").ajaxSubmit success: (data) ->
                    addMessage "Emailed certificate successfully.", 250, 6000, 4000

                  updateActions()
                  $(this).dialog "close"

                Preview: ->
                  window.open "Report.CMECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=5&SelectedMembers=" + oPerson.nPerson

                Cancel: ->
                  $(this).dialog "close"

              open: ->

              close: ->
                $("#email-cert-dialog").html ""
                oPerson.nPerson = ""

            
            # OPEN EMAIL CERT DIALOG
            $("#email-cert-dialog").dialog "open"
          when "pCMECert"
            window.open "/Report/CMECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=5&SelectedMembers=" + oPerson.nPerson
          when "CNECert"
            window.open "/Report/CNECert?ActivityID=" + ccpd.tier2.nActivity + "&ReportID=6&SelectedMembers=" + oPerson.nPerson
          when "credits"
            $.post "/Activity/AdjustCredits",
              ActivityID: ccpd.tier2.nActivity
              PersonID: oPerson.nPerson
              AttendeeID: oPerson.nAttendee
            , (data) ->
              $("#CreditsDialog").html data

            
            # CREDITS DIALOG
            $("#CreditsDialog").dialog
              title: "Adjust Credits"
              modal: true
              autoOpen: true
              height: 175
              width: 400
              resizable: false
              overlay:
                opacity: 0.5
                background: "black"

              buttons:
                Save: ->
                  $("#formAdjustCredits").ajaxSubmit()
                  addMessage "Credits successfully updated.", 250, 6000, 4000
                  updateActions()
                  $(this).dialog "close"

                Cancel: ->
                  $(this).dialog "close"

              open: ->

              close: ->
                $("#CreditsDialog").html ""
                oPerson.nPerson = ""

            
            # OPEN CREDITS DIALOG
            $("#CreditsDialog").dialog "open"
          when "togglemd"
            if $("#md-status-" + oPerson.nAttendee).text() is "Yes"
              Result = "N"
            else Result = "Y"  if $("#md-status-" + oPerson.nAttendee).text() is "No"
            $.ajax
              url: "/AJAX_adm_Activity/updateMDStatus"
              type: "post"
              data:
                AttendeeID: oPerson.nAttendee
                MDNonMD: Result

              dataType: "json"
              success: (data) ->
                if data.STATUS
                  addMessage data.STATUSMSG, 250, 6000, 4000
                  updateStats()
                  if Result is "Y"
                    $("#md-status-" + oPerson.nAttendee).text "Yes"
                  else $("#md-status-" + oPerson.nAttendee).text "No"  if Result is "N"
                else
                  addError data.STATUSMSG, 250, 6000, 4000

          when "sendCertificate"
            if confirm("Are you sure you want to send " + oPerson.sPersonName + " a copy of their ceritificate?")
              $.ajax
                url: "/AJAX_adm_Activity/sendCertificate"
                type: "post"
                data:
                  activityId: ccpd.tier2.nActivity
                  PersonID: oPerson.nPerson
                  AttendeeID: oPerson.nAttendee
                  returnFormat: "plain"

                dataType: "json"
                success: (data) ->
                  if data.STATUS
                    addMessage data.STATUSMSG, 250, 6000, 4000
                  else
                    addError data.STATUSMSG, 250, 6000, 4000

          when "reset"
            if confirm("Are you sure you want to reset the attendee record for " + oPerson.sPersonName + "?")
              if confirm("Do you want to clear all payment information attached to current attendee record for " + oPerson.sPersonName + "?")
                resetAttendee ccpd.tier2.nActivity, oPerson.nAttendee, "Y"
              else
                resetAttendee ccpd.tier2.nActivity, oPerson.nAttendee, "N"
          when "remove"
            if confirm("Are you sure you would like to remove " + oPerson.sPersonName + " from this activity?")
              $.ajax
                url: "/AJAX_adm_Activity/removeCheckedAttendees"
                type: "post"
                data:
                  AttendeeList: oPerson.nAttendee
                  ActivityID: ccpd.tier2.nActivity
                  returnFormat: "plain"

                dataType: "json"
                success: (data) ->
                  if data.STATUS
                    $("#attendeeRow-" + oPerson.nAttendee).fadeOut "medium"
                    addMessage data.STATUSMSG, 250, 6000, 4000
                    updateActions()
                    updateStats()
                  else
                    addError data.STATUSMSG, 250, 6000, 4000
                    updateRegistrants nId
                    updateActions()
                    updateStats()

        J.preventDefault()



  $.fn.isPersonActionMenu = ->
    $actionMenu = $("#action_menu")
    @one "mouseover", ->
      oPerson = defineVars(this)
      sMenuHTML = $actionMenu.html()
      
      # REPLACE VARIABLES 
      sMenuHTML = $.Replace(sMenuHTML, "{personid}", oPerson.nPerson, "ALL") #PersonID
      sMenuHTML = $.Replace(sMenuHTML, "{activityid}", ccpd.tier2.nActivity, "ALL") #ActivityID
      oPerson.oLink.addClass("clicked").after sMenuHTML
      oPerson.oLink.siblings("ul").find("a").find("span").html(oPerson.sPersonName).end().isPersonActionLink()
      false

