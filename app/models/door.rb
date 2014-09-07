class Door < ActiveRecord::Base
  before_create :generate_hex
  has_many :magnets

  accepts_nested_attributes_for :magnets

  validates :name, presence: true
  attr_accessor :wordlist

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

  DEFAULT_WORDS = %w(man the cat dog chicken ate looked at the a car metal 
    ran swam fly plane moon left woman wife girl boy computer an of look
    take wants car phone computer sing hear call)
end
