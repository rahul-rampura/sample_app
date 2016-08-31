require 'spec_helper'

describe "Static Pages" do

  describe "Home Page" do
    it "should have content 'Sample App'" do
    	visit '/static_pages/home'
    	expect(page).to have_content('Sample App')
    end

    it "should have right title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title('Ruby on Rails Tutorial Sample App | Home')
    end
  end

  describe "Help Page" do
    it "should have content 'Help'" do
    	visit '/static_pages/help'
    	expect(page).to have_content('Help')
    end

    it "should have right title 'Help'" do
    	visit '/static_pages/help'
    	expect(page).to have_title('Ruby on Rails Tutorial Sample App | Help')
    end
  end

  describe "About Page" do
    it "should have content 'About'" do
    	visit '/static_pages/about'
    	expect(page).to have_content('About')
    end

    it "should have right title 'About'" do
    	visit '/static_pages/about'
    	expect(page).to have_title('Ruby on Rails Tutorial Sample App | About')
    end
  end

end
