require "rails_helper"

RSpec.feature "Add documents", js: true do
	before :each do
		User.create(email: 'user@example.com', password: 'password')
	end

	scenario "User creates a new document" do
		visit "/documents/new"

		within("#new_user") do
			fill_in 'Email', with: 'user@example.com'
			fill_in 'Password', with: 'password'
		end

		click_button 'Log in'

		expect(page).to have_text("Create new document")
	end
end