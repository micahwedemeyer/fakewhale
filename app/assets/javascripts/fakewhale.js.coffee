window.Fakewhale =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new Fakewhale.Routers.Tweets()
    Backbone.history.start({pushState: true})

$(document).ready ->
  Fakewhale.init()
