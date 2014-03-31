_ = require 'underscore'

class Evaluator

  constructor: (@plugins = {}) ->

  register: (name, type) ->
    @plugins[name] = type

  check: (func, args) ->
    conditions = @getConditions(func)
    _.each conditions, (c) -> c.check(func, args)

  getConditions: (func) ->
    _.map @extractRules(func), (spec, name) =>
      unless @plugins[name]?
        throw new Error("Could not resolve condition for rule '#{name}'")
      new @plugins[name](spec)

  extractRules: (func) ->
    regex = /"ensure:\s*(.*?)";/g
    match = regex.exec func.toString()
    return [] unless match?
    pairs = match[1].split /\s*;\s*/
    return _.object _.map pairs, (pair) -> pair.split /\s*=\s*/

module.exports = Evaluator
