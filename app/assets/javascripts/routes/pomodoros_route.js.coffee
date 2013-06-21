Timevault.PomodorosIndexRoute = Ember.Route.extend
  model: -> Timevault.Pomodoro.find()
