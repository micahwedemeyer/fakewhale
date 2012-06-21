class Fakewhale.Models.User extends Backbone.Model
  defaults:
    name: "Your Victim",
    profile_image_url: "https://twimg0-a.akamaihd.net/sticky/default_profile_images/default_profile_0_reasonably_small.png"


  saveTweet: (message, cb) ->
    tweet = new Fakewhale.Models.Tweet()

    tweet.on("sync", () ->
      cb(tweet)
    )

    tweet.on("error", (model, error) ->
      alert(error)
    )

    tweet.save(
      username: @get('screen_name'),
      message: message
    )
