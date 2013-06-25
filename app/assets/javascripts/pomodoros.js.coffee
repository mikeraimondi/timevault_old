# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  integerTimeToHMS = (integerTime) ->
    hours = Math.floor(integerTime / 3600)
    if hours.toString().length == 1
      hours = "0#{hours}"
    integerTime = integerTime - hours * 3600
    minutes = Math.floor(integerTime / 60)
    if minutes.toString().length == 1
      minutes = "0#{minutes}"
    integerTime = integerTime - minutes * 60
    seconds = integerTime
    if seconds.toString().length == 1
      seconds = "0#{seconds}"
    time =
      hours: hours
      minutes: minutes
      seconds: seconds
    time

  setBarWidth = (percentWidth) ->
    $("#pomodoro-bar").width("#{percentWidth}%")

  resetActivePomodoro = ->
    $(".pom-start").removeAttr("disabled")
    $(".progress").fadeOut()
    $(".pause-btn").fadeOut()

  updateBar = ->
    if window.durationRemaining > 0
      percentComplete = (window.durationRemaining / window.totalDuration) * 100
      setBarWidth(percentComplete)
      window.durationRemaining--
      time = integerTimeToHMS(window.durationRemaining)
      $("#active-remaining").text("#{time.hours}:#{time.minutes}:#{time.seconds}")
    else
      resetActivePomodoro
      clearInterval(window.interval)

  val = $(".pause-btn").val()
  if val == "Pause"
    time = $(".remaining").text()
    splitTime = time.split(":")
    timeSeconds = (splitTime[0] * 60 * 60) + (splitTime[1] * 60) + parseInt(splitTime[2])
    $.getJSON '/pomodoros', (pomodoros) ->
      activePomodoro = pomodoros[0].pomodoro
      window.durationRemaining = timeSeconds
      window.totalDuration = activePomodoro.duration
      window.interval = setInterval(updateBar, 1000)
