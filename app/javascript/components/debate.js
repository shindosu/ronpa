// App['debate_<%= @debate.id %>'] = App.cable.subscriptions.create(
//   { channel: 'DebatesChannel', debate_id: <%= @debate.id %> },
//   { received: (data) => console.log(data) }
// });