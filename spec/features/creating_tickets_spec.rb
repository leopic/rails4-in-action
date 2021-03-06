require 'rails_helper'

describe 'Creating Tickets' do
  before do
    project = FactoryGirl.create(:project, name: 'Internet Explorer')
    user = FactoryGirl.create(:user)

    visit '/'
    click_link project.name
    click_link 'New Ticket'
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Sign in"

    click_link project.name
    click_link "New Ticket"
  end

  it 'creates a ticket' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created')

    within "#ticket #author" do
      expect(page).to have_content("Created by Em@il")
    end
  end

  it 'fails when trying to create an invalid ticket' do
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created')
    expect(page).to have_content('Title can\'t be blank')
    expect(page).to have_content('Description can\'t be blank')
  end

  it 'fails when the description is too short' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'short!'

    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created')
    expect(page).to have_content('Description is too short')
  end
end
