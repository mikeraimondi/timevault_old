class PomodoroSerializer < ActiveModel::Serializer
  attributes :id, :duration, :duration_remaining
end
