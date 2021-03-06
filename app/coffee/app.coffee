
# Application class definition
# Manages lifecycle and bootstraps application
class Application extends Marionette.Service

  radioEvents:
    'app redirect': 'redirectTo'

  # Invoked after constructor
  initialize: ->

    # Starts Header Component
    Backbone.Radio.channel('header').trigger('reset')

    # Starts Henson.js Components
    Backbone.Radio.channel('breadcrumb').trigger('ready')
    Backbone.Radio.channel('overlay').trigger('ready')
    @onReady()
    return true

  # Starts the application
  # Starts Backbone.history (enables routing)
  # And initializes sidebar module
  onReady: ->
    Backbone.history.start()

  # Redirection interface
  # Used accross the application to redirect
  # to specific views after specific actions
  redirectTo: (route) ->
    window.location = route
    return true

# # # # #

module.exports = Application
