# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, presence: true, length: { minimum: 5, maximum: 140 }
  validates :user_id, presence: true

  default_scope order: 'bookmarks.created_at DESC'
end
