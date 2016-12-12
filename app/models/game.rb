class Game < ActiveRecord::Base
  has_many :tweets
  belongs_to :player, {class_name: "User"}
end
