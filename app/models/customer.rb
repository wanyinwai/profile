class Customer < ActiveRecord::Base
  has_attached_file :avatar,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment  :avatar, :presence => true,
                        :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/png"] },
                        :size => { :in => 0..10.megabytes }
end
