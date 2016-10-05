class Service < ActiveRecord::Base
	belongs_to :customer
	
	validates :bank_name, :acct_name, :acct_num, presence: true

end
