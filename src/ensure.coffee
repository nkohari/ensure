Evaluator      = require './Evaluator'
ArityCondition = require './conditions/ArityCondition'

evaluator = new Evaluator
  arity: ArityCondition

exports.wrap = (func) ->
  return (args...) ->
    evaluator.check(func, args)
    func.apply(this, args)

exports.register = (name, plugin) ->
  evaluator.register(name, plugin)
