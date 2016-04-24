require 'rails_helper'

describe 'Editing projects' do
  before do
    FactoryGirl.create(:project, name: 'Dolphin')

    visit '/'
    click_link 'Dolphin'
    click_link 'Edit Project'
  end

  it 'successfully edits a project' do
    fill_in 'Name', with: 'Gamecube'
    # byebug
    click_button 'Update Project'

    expect(page).to have_content('Project has been updated')
  end

  it 'Shows an error when using an empty name' do
    fill_in 'Name', with: ''
    click_button 'Update Project'

    expect(page).to have_content 'Project has not been updated'
  end
end
