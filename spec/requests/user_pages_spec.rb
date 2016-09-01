require 'spec_helper'

describe "UserPages" do

	subject { page }

	describe "signup page" do 
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "sign up" do
		before { visit signup_path }
		let(:submit) { "Create my account" }

		describe "with valid information" do
			before do
				fill_in "Name",			with:	 "Rahul"
				fill_in "Email",		with:    "rahul.rampura@gmail.com"
				fill_in "Password",		with:    "password"
				fill_in "Confirmation",	with:    "password"
			end

			it "should create a user" do
				expect{ click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by(email: 'rahul.rampura@gmail.com') }

				it { should have_title(user.name) }
				it { should have_link('Sign out') }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			end
		end

		describe "with invalid information" do
			it "should not create a user" do
				expect{ click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_title('Sign up') }
				it { should have_content('error') }
			end
		end
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end
end
