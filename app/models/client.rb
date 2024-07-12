class Client < ApplicationRecord
  validates_presence_of :description, :email
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: :invalid }
  validate :birth_date_cannot_be_in_the_future

  def birth_date_cannot_be_in_the_future
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, :invalid)
    end
  end
end
