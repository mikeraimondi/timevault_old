# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.picker').datetimepicker
    language: 'en',
    pick12HourFormat: true,
    pickDate:false
  if $('div#edit-task').length
    start_date = new Date(task.start)
    end_date = new Date(task.end)
    console.log(end_date)
    start_picker = $('#task_start').data('datetimepicker')
    end_picker = $('#task_end').data('datetimepicker')
    start_picker.setDate(start_date)
    end_picker.setDate(end_date)
