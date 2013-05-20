# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Define a new timer object

# Timer has a time left

# Timer has a state enum [Stopped, Started, Paused]

# Timer is initialized (time left, paused)
# If paused
#   State = Pause
# Else
#   State = Stopped
# Time left = time left 

# Timer has a decrement time left function
#   It subtracts one from time left

# Timer has a start function
#   State = Started

# Timer has a pause function
# Unless State ==Stopped
#   State = Paused

# Timer has a run function
# If State == Started
#   Decrement time left

# On page load:
#   AJAX request to server for timers
#   Foreach timer from server
#   push a new Timer(time left, paused) to timer array

# Every 1 second:
#   Foreach timer in timer array
#     timer.run
