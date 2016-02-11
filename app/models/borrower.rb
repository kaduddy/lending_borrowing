class Borrower < ActiveRecord::Base
  has_secure_password
  has_many :histories
  has_many :donations, through: :histories, source: :lender

end
