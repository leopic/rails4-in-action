require 'rails_helper'

describe 'Deleting Tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:ticket) do
    ticket = FactoryGirl.create(:ticket, project: project)
    ticket.update(user: user)
    ticket
  end

  before do
    sign_in_as!(user)
    visit '/'
    click_link project.name
    click_link ticket.title
  end

  it 'Correctly deletes a ticket' do
    click_link "Delete Ticket"

    expect(page).to have_content("Ticket has been deleted")
    expect(page.current_url).to eq(project_url(project))
  end

end
