class Door < ActiveRecord::Base
  before_create :generate_hex
  has_many :magnets

  accepts_nested_attributes_for :magnets

  validates :name, presence: true
  attr_accessor :wordlist

  delegate :subscribers, to: :websocket_channel

  def to_param
    self.hex
  end

  def websocket_channel
    WebsocketRails["door-#{self.hex}"]
  end

  def trigger event, data
    websocket_channel.trigger(event, data)
  end

  def update_subscribers
    data = {hex: self.hex, subscribers: self.subscribers.length+1}
    WebsocketRails['doors'].trigger('subscriber-joined', data)
  end

  private
  def generate_hex
    self.hex = SecureRandom.hex
  end

  DEFAULT_WORDS = %w(man the cat dog chicken ate looked at the a car metal 
    ran swam fly plane moon left woman wife girl boy computer an of look
    take wants car phone computer sing hear call)
end
