class Customer < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	belongs_to :user
	has_many :services, dependent: :destroy
	has_many :customer_histories, dependent: :destroy
	belongs_to :reference
	
	searchkick

	validates :first_name, :last_name, :kanji_first_name, :kanji_last_name, :email_japan, :arrival_date, :service_id, presence: true
	validates :email_japan, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Must be in format of \"thou@gmail.com\""}
end
