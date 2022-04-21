# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, presence: { message: 'cannot be blank' }
  has_many :books, dependent: :destroy
end
