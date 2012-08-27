define "app/log",(require,window) ->
  wndw = window
  # Some convenient shortcuts.
  
  # Public object to be returned.
  
  # Default logging level, show everything.
  
  # Logging methods, in "priority order". Not all console implementations
  # will utilize these, but they will be used in the callback passed to
  # setCallback.
  
  # Pass these methods through to the console if they exist, otherwise just
  # fail gracefully. These methods are provided for convenience.
  
  # Logs are stored here so that they can be recalled as necessary.
  
  # Generate pass-through methods. These methods will be called, if they
  # exist, as long as the logging level is non-zero.
  
  # Method: debug.log
  # 
  # Call the console.log method if available. Adds an entry into the logs
  # array for a callback specified via <debug.setCallback>.
  # 
  # Usage:
  # 
  #  debug.log( object [, object, ...] );                               - -
  # 
  # Arguments:
  # 
  #  object - (Object) Any valid JavaScript object.
  
  # Method: debug.debug
  # 
  # Call the console.debug method if available, otherwise call console.log.
  # Adds an entry into the logs array for a callback specified via
  # <debug.setCallback>.
  # 
  # Usage:
  # 
  #  debug.debug( object [, object, ...] );                             - -
  # 
  # Arguments:
  # 
  #  object - (Object) Any valid JavaScript object.
  
  # Method: debug.info
  # 
  # Call the console.info method if available, otherwise call console.log.
  # Adds an entry into the logs array for a callback specified via
  # <debug.setCallback>.
  # 
  # Usage:
  # 
  #  debug.info( object [, object, ...] );                              - -
  # 
  # Arguments:
  # 
  #  object - (Object) Any valid JavaScript object.
  
  # Method: debug.warn
  # 
  # Call the console.warn method if available, otherwise call console.log.
  # Adds an entry into the logs array for a callback specified via
  # <debug.setCallback>.
  # 
  # Usage:
  # 
  #  debug.warn( object [, object, ...] );                              - -
  # 
  # Arguments:
  # 
  #  object - (Object) Any valid JavaScript object.
  
  # Method: debug.error
  # 
  # Call the console.error method if available, otherwise call console.log.
  # Adds an entry into the logs array for a callback specified via
  # <debug.setCallback>.
  # 
  # Usage:
  # 
  #  debug.error( object [, object, ...] );                             - -
  # 
  # Arguments:
  # 
  #  object - (Object) Any valid JavaScript object.
  
  # Execute the callback function if set.
  exec_callback = (args) ->
    callback_func.apply window, args  if callback_func and (callback_force or not con or not con.log)
  
  # Method: debug.setLevel
  # 
  # Set a minimum or maximum logging level for the console. Doesn't affect
  # the <debug.setCallback> callback function, but if set to 0 to disable
  # logging, <Pass-through console methods> will be disabled as well.
  # 
  # Usage:
  # 
  #  debug.setLevel( [ level ] )                                            - -
  # 
  # Arguments:
  # 
  #  level - (Number) If 0, disables logging. If negative, shows N lowest
  #    priority levels of log messages. If positive, shows N highest priority
  #    levels of log messages.
  #
  # Priority levels:
  # 
  #   log (1) < debug (2) < info (3) < warn (4) < error (5)
  
  # Determine if the level is visible given the current log_level.
  is_level = (level) ->
    (if log_level > 0 then log_level > level else log_methods.length + log_level <= level)
  window = wndw
  aps = Array::slice
  con = window.console
  that = {}
  callback_func = undefined
  callback_force = undefined
  log_level = 9
  log_methods = ["error", "warn", "info", "debug", "log"]
  pass_methods = "assert clear count dir dirxml exception group groupCollapsed groupEnd profile profileEnd table time timeEnd trace".split(" ")
  idx = pass_methods.length
  logs = []
  while --idx >= 0
    ((method) ->
      self[method] = ->
        log_level isnt 0 and con and con[method] and con[method].apply(con, arguments)
    ) pass_methods[idx]
  idx = log_methods.length
  while --idx >= 0
    ((idx, level) ->
      self[level] = ->
        args = aps.call(arguments)
        log_arr = [level].concat(args)
        logs.push log_arr
        exec_callback log_arr
        return  if not con or not is_level(idx)
        (if con.firebug then con[level].apply(window, args) else (if con[level] then con[level](args) else con.log(args)))
    ) idx, log_methods[idx]
  @setLevel = (level) ->
    log_level = (if typeof level is "number" then level else 9)

  
  # Method: debug.setCallback
  # 
  # Set a callback to be used if logging isn't possible due to console.log
  # not existing. If unlogged logs exist when callback is set, they will all
  # be logged immediately unless a limit is specified.
  # 
  # Usage:
  # 
  #  debug.setCallback( callback [, force ] [, limit ] )
  # 
  # arguments_:
  # 
  #  callback - (Function) The aforementioned callback function. The first
  #    argument is the logging level, and all subsequent Arguments are those
  #    passed to the initial debug logging method.
  #  force - (Boolean) If false, log to console.log if available, otherwise
  #    callback. If true, log to both console.log and callback.
  #  limit - (Number) If specified, number of lines to limit initial scrollback
  #    to.
  @setCallback = ->
    args = aps.call(arguments)
    max = logs.length
    i = max
    callback_func = args.shift() or null
    callback_force = (if typeof args[0] is "boolean" then args.shift() else false)
    i -= (if typeof args[0] is "number" then args.shift() else max)
    exec_callback logs[i++]  while i < max