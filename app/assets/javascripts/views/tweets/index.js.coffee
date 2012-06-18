class Fakewhale.Views.TweetsIndex extends Backbone.View
  template: JST['tweets/index']

  events:
    'change #new_tweet_username': 'selectUser'

  render: ->
    $(@el).html(@template())
    this

  selectUser: (event) ->
    event.preventDefault()
    username = $('#new_tweet_username').val()

    $.getJSON("https://api.twitter.com/1/users/show.json?screen_name=" + username + "&callback=?", {}, (data) ->
      alert("Retrieved: " + data.name)
    )
