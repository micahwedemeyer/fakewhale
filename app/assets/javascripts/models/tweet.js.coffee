class Fakewhale.Models.Tweet extends Backbone.Model
  urlRoot: '/api/tweets'

  validate: (attrs) ->
    if attrs.username == undefined || attrs.username.length == 0
      return "Username must be set"

    if attrs.message == undefined || attrs.message.length == 0
      return "Message must be set"
