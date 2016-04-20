require 'rails_helper'

describe 'Creating Projects' do
  it 'can create a project' do
    visit '/'

    click_link 'New Project'

    project_name = 'Dolphin'

    fill_in 'Name', with: project_name
    fill_in 'Description', with: 'The smart shower from Moen'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created')

    title = "#{project_name} - Projects - Tiqueteador"
    expect(page).to have_title(title)

    project = Project.where(name: project_name).first
    expect(page.current_url).to eq(project_url(project))
  end
end
