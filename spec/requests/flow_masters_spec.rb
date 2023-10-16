require 'rails_helper'

RSpec.describe "FlowMasters", type: :request do
  describe "GET /index" do
    it 'returns a list of flow masters' do
      # mock data
      FlowMaster.create(
        name: 'Madam',
        age: 45,
        enjoys: 'Leaving chalk dust on the pupils',
        image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
      )

      # make http request
      get '/flow_masters'

      # storing the value of the body in a variable
      flow_master = JSON.parse(response.body)

      # expecting a status code from the response to be successful
      expect(response).to have_http_status(200)

      # expecting one value to be in the hash
      expect(flow_master.length).to eq 1

    end
  end
end
