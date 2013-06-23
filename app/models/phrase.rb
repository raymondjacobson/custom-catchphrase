# == Schema Information
#
# Table name: phrases
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

class Phrase < ActiveRecord::Base
  attr_accessible :text

  belongs_to :game

  validates :game_id, presence: true
end
