class User < ActiveRecord::Base

  validates :username, presence: true

has_many :games, {foreign_key: :player_id}

end
