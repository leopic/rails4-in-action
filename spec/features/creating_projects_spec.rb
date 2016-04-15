require 'rails_helper'

describe 'Creating Projects' do
  it 'can create a project' do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'Dolphin'
    fill_in 'Description', with: 'The smart shower from Moen'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created')
  end
end
