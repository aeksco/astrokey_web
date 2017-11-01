AbstractKeyboardView = require('./abstractKeyboardView')

# # # #

class FunctionKeyboard extends AbstractKeyboardView
  template: require './templates/function_keyboard'

  # Passes key objects to UI
  templateHelpers: ->
    keys = @options.keys.toJSON()

    return {
      r0: _.where(keys, { row: 'func_r0'})
    }

# # # # #

module.exports = FunctionKeyboard

