class Door < ActiveRecord::Base
  before_create :generate_hex
  has_many :magnets

  def to_param
    self.hex
  end

  private
  def generate_hex
    self.hex = SecureRandom.hex
  end
end
