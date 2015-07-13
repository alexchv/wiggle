class Wiggle.Classes.GrowlFlash
  constructor: (@$scope = $('body')) ->
    messages = @$scope.data('messages')
    for k, v of messages
      Wiggle.Classes.Alert.notifyMessage(v.message, {type: v.type})
