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
require 'rails_helper'

RSpec.describe Micropost, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @attr = {
      :content => "value for content",
      :user_id => 1
    }
  end

  it "devrait créer une nouvelle instance avec les attributs valides" do
    Micropost.create!(@attr)
  end
end
