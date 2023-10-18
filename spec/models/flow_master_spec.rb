require 'rails_helper'

RSpec.describe FlowMaster, type: :model do
  it 'should validate name' do
    rapper = FlowMaster.create(
      age: 24,
      enjoys: 'singing while cooking and creating bars',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'     
    )
    # check out the data
    # p 'rapper:', rapper
    # p 'rapper errors:', rapper.errors
    expect(rapper.errors[:name]).to_not be_empty
  end
  it 'should validate age' do
    rapper = FlowMaster.create(
      name: 'Young Spatula',
      age: nil,
      enjoys: 'singing while cooking and creating bars',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'     
    )
    # check out the data
    # p 'rapper:', rapper
    # p 'rapper errors:', rapper.errors
    expect(rapper.errors[:age]).to_not be_empty
  end
  it 'should validate enjoys' do
    rapper = FlowMaster.create(
      name: 'Young Spatula',
      age: 24,
      enjoys: nil,
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'     
    )
    # check out the data
    # p 'rapper:', rapper
    # p 'rapper errors:', rapper.errors
    expect(rapper.errors[:enjoys]).to_not be_empty
  end
  it 'should validate image' do
    rapper = FlowMaster.create(
      name: 'Young Spatula',
      age: 24,
      enjoys: 'singing while cooking and creating bars',
      image: nil
    )
    # check out the data
    # p 'rapper:', rapper
    # p 'rapper errors:', rapper.errors
    expect(rapper.errors[:image]).to_not be_empty
  end  
  it 'should validate the length of enjoys' do
    rapper = FlowMaster.create(
      name: 'Young Spatula',
      age: 24,
      enjoys: 'singing',
      image: 'https://images.unsplash.com/photo-1492370284958-c20b15c692d2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1049&q=80'     
    )
    # p 'enjoys:', rapper.errors
    expect(rapper.errors[:enjoys]).to_not be_empty
  end
end
