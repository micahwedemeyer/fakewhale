class Fakewhale.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  initialize: (opts = {}) ->
    @options.model = new Fakewhale.Models.Tweet() if !_.has(opts, "model")
    @user = new Fakewhale.Models.User()

  events:
    'click #save_tweet': 'saveTweet'

  render: ->
    message = $("#new_tweet_message").val()
    @$el.html(@template(user: @user, message: message))

    userContainer = @$el.find('#user_container')
    userView = new Fakewhale.Views.User({model: @user, el: userContainer })
    userView.render()

    this

  saveTweet: (event)->
    event.preventDefault()
    message = $("#new_tweet_message").val()
    @user.saveTweet(message, (tweet) ->
      alert("saved to id: #{tweet.get('id')}")
    )
