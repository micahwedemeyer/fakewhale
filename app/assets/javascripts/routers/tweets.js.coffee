class Fakewhale.Routers.Tweets extends Backbone.Router
  routes:
    '': 'index',
    'tweets/:tid': 'tweet'

  index: ->
    tweetView = new Fakewhale.Views.TweetsIndex()
    $('#tweet_container').html(tweetView.render().el)

  tweet: (id) ->
    tweet = new Fakewhale.Models.Tweet({id: id})
    tweet.fetch({
      success: (model, response, options) ->
        alert("showing tweet " + id)
      error: (model, xhr, options) ->
        alert("error")
    })
