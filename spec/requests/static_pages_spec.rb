require 'spec_helper'

describe "Static Pages" do
	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home Page" do
    it "should have content 'Sample App'" do
    	visit "/static_pages/home"
    	expect(page).to have_content("Sample App")
    end

    it "should have base title" do
    	visit "/static_pages/home"
    	expect(page).to have_title("#{base_title}")
    end
  end

  describe "Help Page" do
    it "should have content 'Help'" do
    	visit "/static_pages/help"
    	expect(page).to have_content("Help")
    end

    it "should have right title 'Help'" do
    	visit '/static_pages/help'
    	expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About Page" do
    it "should have content 'About'" do
    	visit '/static_pages/about'
    	expect(page).to have_content('About')
    end

    it "should have right title 'About'" do
    	visit '/static_pages/about'
    	expect(page).to have_title("#{base_title} | About")
    end
  end

   describe "Contact Page" do
    it "should have content 'Contact'" do
    	visit '/static_pages/contact'
    	expect(page).to have_content('Contact')
    end

    it "should have right title 'Contact'" do
    	visit '/static_pages/contact'
    	expect(page).to have_title("#{base_title} | Contact")
    end
  end

end
