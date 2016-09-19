class Customer < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
