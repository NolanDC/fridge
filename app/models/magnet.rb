class Magnet < ActiveRecord::Base
  belongs_to :door

  def position_style
    "left: #{x}px; top: #{y}px;"
  end

  def trigger_update
    door.trigger('update', self)
  end
end
