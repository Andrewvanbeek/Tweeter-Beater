class User < ActiveRecord::Base

  validates :username, :facebook_id, presence: true

end
