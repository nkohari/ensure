class ConditionFailedError

  constructor: (@condition, message) ->
    @message = "#{@condition} failed: #{message}"
    Error.captureStackTrace(this, arguments.callee)

module.exports = ConditionFailedError
