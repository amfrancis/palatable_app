require 'spec_helper'

describe "bookmarks/edit" do
  before(:each) do
    @bookmark = assign(:bookmark, stub_model(Bookmark,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit bookmark form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bookmarks_path(@bookmark), :method => "post" do
      assert_select "input#bookmark_content", :name => "bookmark[content]"
      assert_select "input#bookmark_user_id", :name => "bookmark[user_id]"
    end
  end
end
