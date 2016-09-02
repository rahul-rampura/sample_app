	include ApplicationHelper
	#Returns the full title on a per-page basis					# Document comment
	def full_title(page_title)									# Method Definition
		base_title = "Ruby on Rails Tutorial Sample App"		# Variable declaration
		if page_title.empty?									# Boolean test
			base_title											# Implicit return
		else					
			"#{base_title} | #{page_title}"						# String Interpolation
		end
	end

	def valid_signin(user)
		fill_in "Email", 	with: user.email
		fill_in "Password", with: user.password
		click_button "Sign in"
	end

	RSpec::Matchers.define :have_error_message do |message|
		match do |page|
			expect(page).to have_selector('div.alert.alert-error', text:message)
		end
	end

	def sign_in(user, options={})
		if options[:no_capybara]
			sign_in user
			remember_token = User.new_remember_token
			cookies[:remember_token] = remember_token
			user.update_attribute(:remember_token, User.digest(remember_token))
		else
			visit signin_path
			fill_in "Email", 	with: user.email
			fill_in "Password", with: user.password
			click_button "Sign in"
		end
	end