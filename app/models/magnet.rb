class Magnet < ActiveRecord::Base
  belongs_to :door
  before_create :set_coordinates

  XRANGE = (0..1240)
  YRANGE = (0..800)

  def position_style
    "left: #{x}px; top: #{y}px;"
  end

  def trigger_update
    door.trigger('update', self)
  end

private
  def set_coordinates
    self.x = XRANGE.to_a.sample
    self.y = YRANGE.to_a.sample
  end  
end
