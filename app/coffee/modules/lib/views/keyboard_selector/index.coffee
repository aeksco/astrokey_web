SimpleNav = require('lib/views/simple_nav')
FullKeyboard = require('lib/views/keyboard_full')
NumpadView = require('lib/views/keyboard_numpad')
FunctionKeyboard = require('lib/views/keyboard_function')
MediaKeyboard = require('lib/views/keyboard_media')
NavKeyboard = require('lib/views/keyboard_nav')

# # # # #

class KeyboardSelector extends SimpleNav
  className: 'row h-100'
  template: require('./templates/keyboard_selector')

  navItems: [
    { icon: 'fa-keyboard-o',  text: 'Keyboard',  trigger: 'keyboard', default: true }
    { icon: 'fa-file-text-o', text: 'Numpad',   trigger: 'numpad' }
    { icon: 'fa-caret-square-o-up',    text: 'Function',    trigger: 'function' }
    { icon: 'fa-asterisk',    text: 'Media',    trigger: 'media' }
    { icon: 'fa-asterisk',    text: 'Navigation',    trigger: 'nav' }
  ]

  showKeyboardView: (keyboardView) ->

    # Handles KeySelection event
    keyboardView.on 'key:selected', (key) => @trigger('key:selected', key)

    # Shows the keyboardView
    @contentRegion.show keyboardView

  onNavigateKeyboard: ->
    @showKeyboardView(new FullKeyboard({ model: @model, keys: @options.keys }))

  onNavigateNumpad: ->
    @showKeyboardView(new NumpadView({ model: @model, keys: @options.keys }))

  onNavigateFunction: ->
    @showKeyboardView(new FunctionKeyboard({ model: @model, keys: @options.keys }))

  onNavigateMedia: ->
    @showKeyboardView(new MediaKeyboard({ model: @model, keys: @options.keys }))

  onNavigateNav: ->
    @showKeyboardView(new NavKeyboard({ model: @model, keys: @options.keys }))

# # # # #

module.exports = KeyboardSelector
