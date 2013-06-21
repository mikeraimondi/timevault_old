Timevault.Router.map (match)->
  # match('/pomodoros').to('index')
  @resource "pomodoros", ->
    @route "new"
