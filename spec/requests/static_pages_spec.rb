require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'pal.atab.le Home'" do
      visit '/static_pages/home'
      page.should have_content('pal.atab.le Home')
    end


    it "should have the base title " do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "pal.atab.le")
    end

    it "should not have a custom page title" do
        visit '/static_pages/home'
        page.should_not have_selector('title',
                        :text => '| Home')
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

