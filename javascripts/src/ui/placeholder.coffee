dataPlaceholders = document.querySelectorAll("input[placeholder]")
l = dataPlaceholders.length

# Set caret at the beginning of the input
setCaret = (evt) ->
    if @value is @getAttribute("data-placeholder")
        @setSelectionRange 0, 0
        evt.preventDefault()
        evt.stopPropagation()
        false


# Clear placeholder value at user input
clearPlaceholder = (evt) ->
    if not (evt.shiftKey and evt.keyCode is 16) and evt.keyCode isnt 9
        if @value is @getAttribute("data-placeholder")
            @value = ""
            @className = "active"
            @type = "password"  if @getAttribute("data-type") is "password"

restorePlaceHolder = ->
    if @value.length is 0
        @value = @getAttribute("data-placeholder")
        setCaret.apply this, arguments_
        @className = ""
        @type = "text"  if @type is "password"

clearPlaceholderAtSubmit = (evt) ->
    i = 0
    placeholder = undefined

    while i < l
        placeholder = dataPlaceholders[i]
        placeholder.value = ""  if placeholder.value is placeholder.getAttribute("data-placeholder")
        i++

i = 0
placeholder = undefined
placeholderVal = undefined

while i < l
    placeholder = dataPlaceholders[i]
    placeholderVal = placeholder.getAttribute("placeholder")
    placeholder.setAttribute "data-placeholder", placeholderVal
    placeholder.removeAttribute "placeholder"
    if placeholder.value.length is 0
        placeholder.value = placeholderVal
        placeholder.type = "text"  if placeholder.type is "password"
    else
        placeholder.className = "active"
    
    # Apply events for placeholder handling         
    placeholder.addEventListener "focus", setCaret, false
    placeholder.addEventListener "drop", setCaret, false
    placeholder.addEventListener "click", setCaret, false
    placeholder.addEventListener "keydown", clearPlaceholder, false
    placeholder.addEventListener "keyup", restorePlaceHolder, false
    placeholder.addEventListener "blur", restorePlaceHolder, false
    
    # Clear all default placeholder values from the form at submit
    placeholder.form.addEventListener "submit", clearPlaceholderAtSubmit, false
    i++