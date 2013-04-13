require 'spec_helper'

describe "bookmarks/new" do
  before(:each) do
    assign(:bookmark, stub_model(Bookmark,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookmarks_path, :method => "post" do
      assert_select "input#bookmark_content", :name => "bookmark[content]"
      assert_select "input#bookmark_user_id", :name => "bookmark[user_id]"
    end
  end
end
