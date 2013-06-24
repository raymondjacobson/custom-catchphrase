# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  phrases    :text
#

class Game < ActiveRecord::Base
  attr_accessible :name, :phrases

  belongs_to :user

  validates :user_id, presence: true
  
end
