class CustomerHistory < ActiveRecord::Base
	belongs_to :customer
	validates :problem, presence: true
end
