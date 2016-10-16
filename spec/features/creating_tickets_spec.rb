require 'rails_helper'

describe 'Creating Tickets' do
  before do
    FactoryGirl.create(:project, name: 'Internet Explorer')

    visit '/'
    click_link 'Internet Explorer'
    click_link 'New Ticket'
  end

  it 'creates a ticket' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created')
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
