expect               = require('chai').expect
ensure               = require '../src/ensure'
ConditionFailedError = require '../src/errors/ConditionFailedError'
functions            = require './lib/functions'

describe 'Wrapped functions', ->

  describe 'given a wrapped function', ->

    addTwoNumbers = ensure.wrap(functions.addTwoNumbers)

    describe 'when a precondition fails', ->

      func = -> addTwoNumbers(1, 2, 3)

      it 'should throw a ConditionFailedError', ->
        expect(func).to.throw(ConditionFailedError)

    describe 'when all preconditions are met', ->

      result = addTwoNumbers(1, 2)

      it 'should call the wrapped function and return the correct result', ->
        expect(result).to.equal(3)
