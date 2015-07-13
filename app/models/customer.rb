class Customer < ActiveRecord::Base
	# paperclip upload setting
	has_attached_file :avatar,
	                :styles => { :medium => "300x300>", :thumb => "100x100>" },
									:storage => :s3,
									:path => "/profilecustom/:id/:style/:filename",
									:bucket => ENV['AWS_BUCKET'],
									:s3_host_name => "s3-ap-southeast-1.amazonaws.com",
	                :s3_credentials => {
	                  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
	                  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
	            	  }

	                #:default_url => "/images/:style/missing.png"

	validates_attachment  :avatar,
	                    :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/png"] },
	                    :size => { :in => 0..10.megabytes }


end
