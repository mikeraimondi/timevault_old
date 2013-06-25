# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  updateBar = ->
    if window.durationRemaining > 0
      percentComplete = (window.durationRemaining / window.totalDuration) * 100
      setBarWidth(percentComplete)
      window.durationRemaining--
      time = window.durationRemaining
      hours = Math.floor(time / 3600)
      if hours.toString().length == 1
        hours = "0#{hours}"
      time = time - hours * 3600
      minutes = Math.floor(time / 60)
      if minutes.toString().length == 1
        minutes = "0#{minutes}"
      time = time - minutes * 60
      seconds = time
      if seconds.toString().length == 1
        seconds = "0#{seconds}"
      $(".remaining").text("#{hours}:#{minutes}:#{seconds}")
    else
      $(".pom-start").removeAttr("disabled")
      $(".progress").fadeOut()
      $(".pause-btn").fadeOut()
      clearInterval(window.interval)

  setBarWidth = (percentWidth) ->
    $(".bar").width("#{percentWidth}%")

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
