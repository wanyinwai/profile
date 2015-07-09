class Customer < ActiveRecord::Base
	# define s3 credentials
	def s3_credentials
    	{:bucket => ENV['AWS_BUCKET'],
    	 :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
    	 :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end

	# paperclip upload setting
	has_attached_file :avatar,
	                :styles => { :medium => "300x300>", :thumb => "100x100>" },
	                :default_url => "/images/:style/missing.png",
	                :storage => :s3,
	                :path => "/profile-custom",
	                :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

	validates_attachment  :avatar,
	                    :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/png"] },
	                    :size => { :in => 0..10.megabytes }


end
