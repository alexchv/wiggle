class Wiggle.Classes.WebsiteInput
  constructor: (@$scope = $('body')) ->
    @$scope.on 'submit', (event) ->
      $.cookie("wiggle_website", $(@).find("[name='website[url]']").val())

