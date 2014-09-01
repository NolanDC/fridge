class Door < ActiveRecord::Base
  before_create :generate_hex
  has_many :magnets

  def to_param
    self.hex
  end

  def trigger event, data
    WebsocketRails["door-#{self.hex}"].trigger(event, data)
  end

  private
  def generate_hex
    self.hex = SecureRandom.hex
  end
end
