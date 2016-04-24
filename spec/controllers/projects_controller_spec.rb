require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  it 'handles missing projects okay' do
    get :show, id: 'nope'
    expect(response).to redirect_to projects_path
    message = 'Project not found'
    expect(flash[:alert]).to eq message
  end

end
