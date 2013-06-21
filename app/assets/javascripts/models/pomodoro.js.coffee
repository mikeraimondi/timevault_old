Timevault.Pomodoro = DS.Model.extend
  duration: DS.attr("number")
  durationRemaining: DS.attr("number")
  percent:( ->
    @get('durationRemaining') / @get('duration')
  ).property('duration', 'durationRemaining')
