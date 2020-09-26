# == Schema Information
#
# Table name: microposts
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_microposts_on_user_id  (user_id)
#
class Micropost < ApplicationRecord

    belongs_to :user

    validates :content, :presence => true, :length => { :maximum => 140 }
    validates :user_id, :presence => true

    default_scope -> { order(created_at: :desc) }
end
