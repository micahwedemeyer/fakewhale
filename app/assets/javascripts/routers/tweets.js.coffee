class Fakewhale.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index'

  index: ->
    tweetView = new Fakewhale.Views.TweetsIndex()
    $('#tweet_container').html(tweetView.render().el)
