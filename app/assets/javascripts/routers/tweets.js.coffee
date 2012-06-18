class Fakewhale.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    view = new Fakewhale.Views.TweetsIndex()
    $('#container').html(view.render().el)
