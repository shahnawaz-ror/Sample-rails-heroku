App.room = App.cable.subscriptions.create "WebNotificationsChannel",
  received: (data) ->
    console.log('ssss')
    $('#notification-count').text(" students "+data['message'])