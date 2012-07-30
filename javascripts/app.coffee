namespace = (target, name, block) ->
  [target, name, block] = [exports ? window, arguments...] if arguments.length < 3
  top = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

namespace 'ce', (exports) ->
	exports.hi = -> console.log 'Hi World!'

namespace 'ce.activity', (exports) ->
	exports.test 'what up'
