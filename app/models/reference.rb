class Reference < ActiveRecord::Base
	has_many :customers

	validates :first_name, :last_name, presence: true
end
