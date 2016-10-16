require 'rails_helper'

describe 'Viewing Tickets' do
  before do
    typora = FactoryGirl.create(:project, name: 'Typora')
    FactoryGirl.create(:ticket, project: typora, title: 'Pegue brillo', description: 'Moar shiny, such wow!!')

    ie = FactoryGirl.create(:project, name: 'Internet Explorer')
    FactoryGirl.create(:ticket, project: ie, title: 'Standards compliance', description: 'Isn\'t a joke.')

    visit '/'
  end

  it 'displays the corresponding tickets for a project' do
    click_link 'Typora'

    expect(page).to have_content('Pegue brillo')
    expect(page).to_not have_content('Standards compliance')

    click_link 'Pegue brillo'

    within('#ticket h2') do
      expect(page).to have_content('Pegue brillo')
    end

    expect(page).to have_content('Moar shiny, such wow!!')
  end
end
