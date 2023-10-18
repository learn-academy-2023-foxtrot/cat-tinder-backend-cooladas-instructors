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

  describe 'POST /create' do
    it 'creates a new rapper' do
      # mock data
      rapper_params = {
        flow_master: {
          name: 'Madam',
          age: 45,
          enjoys: 'Leaving chalk dust on the pupils',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }
      
      # http request
      post '/flow_masters', params: rapper_params

      # checking for a successful response
      # to see the response
      # p 'response:', response

      # expect successful response
      expect(response).to have_http_status(200)
      
      # expect one instance 
      new_rapper = FlowMaster.first
      # p new_rapper
      # verify the values of each attribute
      expect(new_rapper.age).to eq 45
      expect(new_rapper.name).to eq 'Madam'

    end
    # validation for a missing name
    it 'does not create a new rapper missing a name' do
      # mock data
      rapper_params = {
        flow_master: {
          name: nil,
          age: 45,
          enjoys: 'Leaving chalk dust on the pupils',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      post '/flow_masters', params: rapper_params
      # p "response:", response
      expect(response.status).to eq 422

      # p "response body: ", response.body
      rapper_error = JSON.parse(response.body)
      expect(rapper_error['name']).to include "can't be blank"
    end
    # validation for a missing age
    it 'does not create a new rapper missing an age' do
      # mock data
      rapper_params = {
        flow_master: {
          name: 'Madam',
          age: nil,
          enjoys: 'Leaving chalk dust on the pupils',
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      post '/flow_masters', params: rapper_params
      # p "response:", response
      expect(response.status).to eq 422

      # p "response body: ", response.body
      rapper_error = JSON.parse(response.body)
      expect(rapper_error['age']).to include "can't be blank"
    end
    # validation for a missing age
    it 'does not create a new rapper missing an enjoys' do
      # mock data
      rapper_params = {
        flow_master: {
          name: 'Madam',
          age: 45,
          enjoys: nil,
          image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
        }
      }

      post '/flow_masters', params: rapper_params
      # p "response:", response
      expect(response.status).to eq 422

      # p "response body: ", response.body
      rapper_error = JSON.parse(response.body)
      expect(rapper_error['enjoys']).to include "can't be blank"
    end
    # validation for a missing age
    it 'does not create a new rapper missing an image' do
      # mock data
      rapper_params = {
        flow_master: {
          name: 'Madam',
          age: 45,
          enjoys: 'Leaving chalk dust on the pupils',
          image: nil
        }
      }

      post '/flow_masters', params: rapper_params
      # p "response:", response
      expect(response.status).to eq 422

      # p "response body: ", response.body
      rapper_error = JSON.parse(response.body)
      expect(rapper_error['image']).to include "can't be blank"
    end
  end
end
