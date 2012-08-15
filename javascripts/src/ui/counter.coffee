ce.module "ui", (self, ce, Backbone, Marionette, $, _) ->
  self.Counter = (d, options) ->
    # Default values
    
    ###
    Sets the value of the counter and animates the digits to new value.
    
    Example: myCounter.setValue(500); would set the value of the counter to 500,
    no matter what value it was previously.
    
    
    @param {int} n
    New counter value
    ###
    
    ###
    Sets the increment for the counter. Does NOT animate digits.
    ###
    
    ###
    Sets the pace of the counter. Only affects counter when auto == true.
    
    @param {int} n
    New pace for counter in milliseconds
    ###
    
    ###
    Sets counter to auto-incrememnt (true) or not (false).
    
    @param {bool} a
    Should counter auto-increment, true or false
    ###
    
    ###
    Increments counter by one animation based on set 'inc' value.
    ###
    
    ###
    Adds a number to the counter value, not affecting the 'inc' or 'pace' of the counter.
    
    @param {int} n
    Number to add to counter value
    ###
    
    ###
    Subtracts a number from the counter value, not affecting the 'inc' or 'pace' of the counter.
    
    @param {int} n
    Number to subtract from counter value
    ###
    
    ###
    Increments counter to given value, animating by current pace and increment.
    
    @param {int} n
    Number to increment to
    @param {int} t (optional)
    Time duration in seconds - makes increment a 'smart' increment
    @param {int} p (optional)
    Desired pace for counter if 'smart' increment
    ###
    
    # Smart increment
    
    # Initial best guess
    
    # Could not find optimal settings, use best found so far
    
    # Optimal settings found, use those
    
    # Regular increment
    
    ###
    Gets current value of counter.
    ###
    
    ###
    Stops all running increments.
    ###
    
    #---------------------------------------------------------------------------//
    doCount = ->
      x = o.value
      o.value += o.inc
      y = o.value
      digitCheck x, y
      nextCount = setTimeout(doCount, o.pace)  if o.auto is true
    doIncrement = (n, s, c) ->
      val = o.value
      smart = (if (typeof s is "undefined") then false else s)
      cycles = (if (typeof c is "undefined") then 1 else c)
      cycles--  if smart is true
      unless val is n
        x = o.value
        o.auto = true

        if val + o.inc <= n and cycles isnt 0
          val += o.inc
        else
          val = n
        o.value = val
        y = o.value
        digitCheck x, y
        nextCount = setTimeout(->
          doIncrement n, smart, cycles
        , o.pace)
      else
        o.auto = false
    digitCheck = (x, y) ->
      digitsOld = splitToArray(x)
      digitsNew = splitToArray(y)
      diff = undefined
      xlen = digitsOld.length
      ylen = digitsNew.length
      if ylen > xlen
        diff = ylen - xlen
        while diff > 0
          addDigit ylen - diff + 1, digitsNew[ylen - diff]
          diff--
      if ylen < xlen
        diff = xlen - ylen
        while diff > 0
          removeDigit xlen - diff
          diff--
      i = 0

      while i < xlen
        animateDigit i, digitsOld[i], digitsNew[i]  unless digitsNew[i] is digitsOld[i]
        i++
    animateDigit = (n, oldDigit, newDigit) ->
      
      # Cap on slowest animation can go
      animate = ->
        if step < 7
          w = (if step < 3 then "t" else "b")
          a = doc.getElementById(divId + "_" + w + "_d" + n)
          a.style.backgroundPosition = bp[step]  if a
          step++
          unless step is 3
            setTimeout animate, speed
          else
            animate()
      speed = undefined
      step = 0
      w = undefined
      a = undefined
      bp = ["-" + o.fW + "px -" + (oldDigit * o.tFH) + "px", (o.fW * -2) + "px -" + (oldDigit * o.tFH) + "px", "0 -" + (newDigit * o.tFH) + "px", "-" + o.fW + "px -" + (oldDigit * o.bFH + o.bOffset) + "px", (o.fW * -2) + "px -" + (newDigit * o.bFH + o.bOffset) + "px", (o.fW * -3) + "px -" + (newDigit * o.bFH + o.bOffset) + "px", "0 -" + (newDigit * o.bFH + o.bOffset) + "px"]
      if o.auto is true and o.pace <= 300
        switch n
          when 0
            speed = o.pace / 6
          when 1
            speed = o.pace / 5
          when 2
            speed = o.pace / 4
          when 3
            speed = o.pace / 3
          else
            speed = o.pace / 1.5
      else
        speed = 80
      speed = (if (speed > 80) then 80 else speed)
      animate()
    
    # Creates array of digits for easier manipulation
    splitToArray = (input) ->
      input.toString().split("").reverse()
    
    # Adds new digit
    addDigit = (len, digit) ->
      li = Number(len) - 1
      newDigit = doc.createElement("ul")
      newDigit.className = "cd"
      newDigit.id = divId + "_d" + li
      newDigit.innerHTML = "<li class=\"t\" id=\"" + divId + "_t_d" + li + "\"></li><li class=\"b\" id=\"" + divId + "_b_d" + li + "\"></li>"
      if li % 3 is 0
        newComma = doc.createElement("ul")
        newComma.className = "cd"
        newComma.innerHTML = "<li class=\"s\"></li>"
        div.insertBefore newComma, div.firstChild
      div.insertBefore newDigit, div.firstChild
      doc.getElementById(divId + "_t_d" + li).style.backgroundPosition = "0 -" + (digit * o.tFH) + "px"
      doc.getElementById(divId + "_b_d" + li).style.backgroundPosition = "0 -" + (digit * o.bFH + o.bOffset) + "px"
    
    # Removes digit
    removeDigit = (id) ->
      remove = doc.getElementById(divId + "_d" + id)
      div.removeChild remove
      
      # Check for leading comma
      first = div.firstChild.firstChild
      if (" " + first.className + " ").indexOf(" s ") > -1
        remove = first.parentNode
        div.removeChild remove
    
    # Sets the correct digits on load
    initialDigitCheck = (init) ->
      
      # Creates the right number of digits
      initial = init.toString()
      count = initial.length
      bit = 1
      i = undefined
      i = 0
      while i < count
        newDigit = doc.createElement("ul")
        newDigit.className = "cd"
        newDigit.id = divId + "_d" + i
        newDigit.innerHTML = newDigit.innerHTML = "<li class=\"t\" id=\"" + divId + "_t_d" + i + "\"></li><li class=\"b\" id=\"" + divId + "_b_d" + i + "\"></li>"
        div.insertBefore newDigit, div.firstChild
        if bit isnt (count) and bit % 3 is 0
          newComma = doc.createElement("ul")
          newComma.className = "cd"
          newComma.innerHTML = "<li class=\"s\"></li>"
          div.insertBefore newComma, div.firstChild
        bit++
        i++
      
      # Sets them to the right number
      digits = splitToArray(initial)
      i = 0
      while i < count
        doc.getElementById(divId + "_t_d" + i).style.backgroundPosition = "0 -" + (digits[i] * o.tFH) + "px"
        doc.getElementById(divId + "_b_d" + i).style.backgroundPosition = "0 -" + (digits[i] * o.bFH + o.bOffset) + "px"
        i++
      
      # Do first animation
      nextCount = setTimeout(doCount, o.pace)  if o.auto is true
    
    # Checks values for smart increment and creates debug text
    checkSmartValues = (diff, cycles, inc, pace, time) ->
      r = result: true
      q = undefined
      
      # Test conditions, all must pass to continue:
      # 1: Unrounded inc value needs to be at least 1
      r.cond1 = (if (diff / cycles >= 1) then true else false)
      
      # 2: Don't want to overshoot the target number
      r.cond2 = (if (cycles * inc <= diff) then true else false)
      
      # 3: Want to be within 10 of the target number
      r.cond3 = (if (Math.abs(cycles * inc - diff) <= 10) then true else false)
      
      # 4: Total time should be within 100ms of target time.
      r.cond4 = (if (Math.abs(cycles * pace - time) <= 100) then true else false)
      
      # 5: Calculated time should not be over target time
      r.cond5 = (if (cycles * pace <= time) then true else false)
      
      # Keep track of 'good enough' values in case can't find best one within 100 loops
      if r.cond1 and r.cond2 and r.cond4 and r.cond5
        q = Math.abs(diff - (cycles * inc)) + Math.abs(cycles * pace - time)
        best.q = q  if best.q is null
        if q <= best.q
          best.pace = pace
          best.inc = inc
      i = 1

      while i <= 5
        r.result = false  if r["cond" + i] is false
        i++
      r
    
    # http://stackoverflow.com/questions/18082/validate-numbers-in-javascript-isnumeric/1830844
    isNumber = (n) ->
      not isNaN(parseFloat(n)) and isFinite(n)
    clearNext = ->
      clearTimeout nextCount
      nextCount = null
    defaults =
      value: 0
      inc: 1
      pace: 1000
      auto: true
      tFH: 39
      bFH: 64
      fW: 53
      bOffset: 390

    o = options or {}
    doc = window.document
    divId = (if typeof d isnt "undefined" and d isnt "" then d else "flip-counter")
    div = doc.getElementById(divId)
    for opt of defaults
      o[opt] = (if (opt of o) then o[opt] else defaults[opt])
    digitsOld = []
    digitsNew = []
    subStart = undefined
    subEnd = undefined
    x = undefined
    y = undefined
    nextCount = null
    newDigit = undefined
    newComma = undefined
    best =
      q: null
      pace: 0
      inc: 0

    @setValue = (n) ->
      if isNumber(n)
        x = o.value
        y = n
        o.value = n
        digitCheck x, y
      this

    @setIncrement = (n) ->
      o.inc = (if isNumber(n) then n else defaults.inc)
      this

    @setPace = (n) ->
      o.pace = (if isNumber(n) then n else defaults.pace)
      this

    @setAuto = (a) ->
      if a and not o.atuo
        o.auto = true
        doCount()
      if not a and o.auto
        clearNext()  if nextCount
        o.auto = false
      this

    @step = ->
      doCount()  unless o.auto
      this

    @add = (n) ->
      if isNumber(n)
        x = o.value
        o.value += n
        y = o.value
        digitCheck x, y
      this

    @subtract = (n) ->
      if isNumber(n)
        x = o.value
        o.value -= n
        if o.value >= 0
          y = o.value
        else
          y = "0"
          o.value = 0
        digitCheck x, y
      this

    @incrementTo = (n, t, p) ->
      clearNext()  if nextCount
      unless typeof t is "undefined"
        time = (if isNumber(t) then t * 1000 else 10000)
        pace = (if typeof p isnt "undefined" and isNumber(p) then p else o.pace)
        diff = (if typeof n isnt "undefined" and isNumber(n) then n - o.value else 0)
        cycles = undefined
        inc = undefined
        check = undefined
        i = 0
        best.q = null
        pace = (if (time / diff > pace) then Math.round((time / diff) / 10) * 10 else pace)
        cycles = Math.floor(time / pace)
        inc = Math.floor(diff / cycles)
        check = checkSmartValues(diff, cycles, inc, pace, time)
        if diff > 0
          while check.result is false and i < 100
            pace += 10
            cycles = Math.floor(time / pace)
            inc = Math.floor(diff / cycles)
            check = checkSmartValues(diff, cycles, inc, pace, time)
            i++
          if i is 100
            o.inc = best.inc
            o.pace = best.pace
          else
            o.inc = inc
            o.pace = pace
          doIncrement n, true, cycles
      else
        doIncrement n

    @getValue = ->
      o.value

    @stop = ->
      clearNext()  if nextCount
      this

    
    # Start it up
    initialDigitCheck o.value
  return