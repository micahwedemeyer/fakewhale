class Fakewhale.Views.User extends Backbone.View
  template: JST['users/user']

  initialize: (opts = {}) ->
    @options.model = new Fakewhale.Models.User() if !_.has(opts, "model")
    @user = @options.model
    @user.on("change:name", @refreshUser, this)

  events:
    'change #new_tweet_username': 'selectUser'

  render: ->
    message = $("#new_tweet_message").val()
    @$el.html(@template(user: @user, message: message))

    if @user.get("profile_background_image_url")
      $("#user_container").css("background-image", "url(#{@user.get("profile_background_image_url")})").
        css("background-repeat", "no-repeat").
        css("background-color", "##{@user.get("profile_background_color")}")

    this

  selectUser: (event) ->
    event.preventDefault()
    username = $('#new_tweet_username').val()

    $.getJSON("https://api.twitter.com/1/users/show.json?screen_name=" + username + "&callback=?", {}, (data) =>
      @user.set(data)
    )

  refreshUser: ->
    @render()
