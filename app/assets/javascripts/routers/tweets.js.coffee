class Fakewhale.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    userView = new Fakewhale.Views.User()
    $('#user_container').html(userView.render().el)
