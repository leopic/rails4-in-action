require 'rails_helper'

describe 'Deleting Tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do
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
