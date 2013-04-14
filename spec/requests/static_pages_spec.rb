require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'pal.atab.le Home'" do
      visit '/static_pages/home'
      page.should have_content('pal.atab.le Home')
    end


    it "should have the title 'pal.atab.le Home'" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "pal.atab.le | Home")
    end
  end

  describe "Help page" do

  it "should have the content 'pal.atab.le Help'" do
      visit '/static_pages/help'
      page.should have_content('pal.atab.le Help')
    end

  it "should have the title 'pal.atab.le Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                        :text => "pal.atab.le | Help")
    end
  end
end

