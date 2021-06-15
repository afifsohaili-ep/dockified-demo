require "rails_helper"
require "percy"

RSpec.feature "Add documents", js: true do
	before :each do
		User.create(email: 'user@example.com', password: 'password')

		visit "/documents/new"

		within("#new_user") do
			fill_in 'Email', with: 'user@example.com'
			fill_in 'Password', with: 'password'
		end

		click_button 'Log in'
	end

	scenario "User visits page to create new document" do
		expect(page).to have_text('Create new document')
		Percy.snapshot(page, { name: 'Create document page' })
	end

	scenario "User sees validation errors" do
		click_button 'Create'

		expect(page).to have_text('Title can\'t be blank')
		expect(page).to have_text('Body can\'t be blank')
		expect(page).to have_text('Body is too short (minimum is 10 characters)')
		Percy.snapshot(page, { name: 'Create document page validation error' })
	end
end