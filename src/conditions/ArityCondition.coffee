ConditionFailedError = require '../errors/ConditionFailedError'

class ArityCondition

  constructor: (arity) ->
    @arity = Number(arity)

  check: (func, args) ->
    unless args.length == @arity
      throw new ConditionFailedError(this, "Expected arity to be #{@arity}, but was #{args.length}")

module.exports = ArityCondition
