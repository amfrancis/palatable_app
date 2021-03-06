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

require 'spec_helper'

describe Bookmark do

  let(:user) { FactoryGirl.create(:user) }
  before { @bookmark = user.bookmarks.build(content: "loremipsum.com") }

  subject { @bookmark }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Bookmark.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

   describe "when user_id is not present" do
    before { @bookmark.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @bookmark.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @bookmark.content = "a" * 141 }
    it { should_not be_valid }
  end
end

