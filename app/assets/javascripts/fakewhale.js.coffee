window.Fakewhale =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Fakewhale.Routers.Tweets()
    Backbone.history.start()

$(document).ready ->
  Fakewhale.init()
