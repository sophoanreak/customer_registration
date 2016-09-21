class Customer < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :services, dependent: :destroy
	has_many :customer_histories, dependent: :destroy
end
