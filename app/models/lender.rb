class Lender < ActiveRecord::Base
  has_secure_password
  has_many :histories
  has_many :transactions, through: :histories, source: :borrower
  validates :f_name, presence: true
end
