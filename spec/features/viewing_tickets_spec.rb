require 'rails_helper'

describe 'Viewing Tickets' do
  before do
    user = FactoryGirl.create(:user)

    typora = FactoryGirl.create(:project, name: 'Typora')
    ticket1 = FactoryGirl.create(:ticket, project: typora, title: 'Pegue brillo', description: 'Moar shiny, such wow!!')
    ticket1.update(user: user)

    ie = FactoryGirl.create(:project, name: 'Internet Explorer')
    ticket2 = FactoryGirl.create(:ticket, project: ie, title: 'Standards compliance', description: 'Isn\'t a joke.')
    ticket2.update(user: user)

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
