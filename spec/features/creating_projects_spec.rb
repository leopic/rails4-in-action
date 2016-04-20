require 'rails_helper'

describe 'Creating Projects' do
  before do
    visit '/'

    click_link 'New Project'
  end


  it 'can create a project' do
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

  it 'can not create a project with no name' do
    click_button 'Create Project'

    expect(page).to have_content('Project has not been created')
    expect(page).to have_content("Name can't be blank")
  end

end
