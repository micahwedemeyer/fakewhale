class Fakewhale.Views.TweetsIndex extends Backbone.View

  template: JST['tweets/index']

  render: ->
    $(@el).html(@template())
    this
