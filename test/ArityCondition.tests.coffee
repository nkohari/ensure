expect               = require('chai').expect
Evaluator            = require '../src/Evaluator'
ArityCondition       = require '../src/conditions/ArityCondition'
ConditionFailedError = require '../src/errors/ConditionFailedError'
functions            = require './lib/functions'

describe 'ArityCondition', ->

  evaluator = new Evaluator {arity: ArityCondition}

  describe 'given a function with the rule: arity=2', ->

    describe 'when presented with 2 arguments', ->
      func = -> evaluator.check(functions.addTwoNumbers, [1, 2])
      it 'should not throw an error', ->
        expect(func).not.to.throw()

    describe 'when presented with a different number of arguments', ->
      func = -> evaluator.check(functions.addTwoNumbers, [1, 2, 3])
      it 'should throw a ConditionFailedError', ->
        expect(func).to.throw(ConditionFailedError)
