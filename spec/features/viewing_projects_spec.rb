require 'rails_helper'

describe 'Viewing projects' do
  it 'Lists all projects' do
    project = FactoryGirl.create(:project, name: "Dolphin")
    visit '/'
    click_link 'Dolphin'
    expect(page.current_url).to eq(project_url(project))
  end
end
