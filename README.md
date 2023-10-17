## Rails API
- The API will cover the M & C: model and controller
- Generating a resource will create model, view, controller, and routes.
- However, we will use React for the views.

## Process to create and test the API functionality
1. Create an empty github repo √
2. Create a local rails application √
3. Connected the github repo and the local rails app √
4. Add all the applicable dependencies √
5. Create a resource √
6. Add seeds √
7. Enable CORS √

## Create a resource
- $ `rails generate resource FlowMaster name:string age:integer enjoys:text image:text`
- $ `rails db: migrate`

## Rspec testing suite
- To see all files: $ `rspec spec`
- To specify one file, give the file path: $ `rspec spec/requests/flow_masters_spec.rb`

6. Add seeds  
### temporary method to create mock data
- $ `rails console` 
> FlowMaster.create(name:'BoneCrumble', age:27,enjoys:'snacks and bars', image:'https://images.unsplash.com/photo-1497562187797-ec8cb333f512?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cmFwcGVyJTIwd2l0aCUyMHZpdGFtaW5zfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60')
- If the database is dropped or shared, the mock data created in rails console would not persist. Use seeds file to maintain mock data.

### seeds (idempotent method to create mock data)
- Create an array with objects that contain the attributes required for the schema
```rb
  # db/seeds.rb
  rappers = [
    {
      name:'BoneCrumble',
      age: 27,
      enjoys:'snacks and bars',
      image: 'https://images.unsplash.com/photo-1497562187797-ec8cb333f512?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cmFwcGVyJTIwd2l0aCUyMHZpdGFtaW5zfGVufDB8fDB8fHww&auto=format&fit=crop&w=400&q=60'
    },
    {
      name: 'RTO',
      age: 42,
      enjoys: 'eating whack rappers for breakfast',
      image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
    },
    {
      name: 'Madam',
      age: 45,
      enjoys: 'Leaving chalk dust on the pupils',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
    }
  ]
```
- use `each` method to iterate across each object in the array and create a data entry using the attributes from the object 
  - as well as provide a printout to the console to show that the entry was made successfully
```rb
  rappers.each do |each_rapper|
    FlowMaster.create each_rapper
    puts "creating flow master #{each_rapper}"
  end
```

7. Enable CORS
- Add the following code to the ApplicationController
```rb
  # app/controllers/application_controller.rb
  skip_before_action :verify_authenticity_token
```
### Enable CORS
- Add `rack-cors` gem to the Gemfile
- Create a cors.rb file in config/initializers directory
- Add the following code to that file
```rb
# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # <- change this to allow requests from any domain while in development.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
- To add required dependencies for the cors: $ `bundle`


## API Endpoints
- Stub out the endpoints
```rb
  def index
  end
  def create
  end
  def update
  end
  def destroy
  end
```
- Make a Test for the endpoint
- See it fail
- Provide the code to make the test pass
- See it pass

## API Validations
### model
- Create the rspec test for the model (spec/models/flow_master_spec.rb)
- See it fail 
- Provide the validation to make it pass (app/models/flow_master.rb)
- See it pass

### controller
- Create the rspec test for the controller(spec/requests/flow_masters_spec.rb)
- See it fail 
- Provide the code to make it pass (app/controllers/flow_masters_controller.rb)
- See it pass

### mock data
```rb
  name: 'Young Spatula',
  age: 24,
  enjoys: 'singing while cooking and creating bars',
  image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'
```