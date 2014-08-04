class Door < ActiveRecord::Base
  before_create :generate_hex
  has_many :magnets

  private
  def generate_hex
    self.hex = SecureRandom.hex
  end
end
