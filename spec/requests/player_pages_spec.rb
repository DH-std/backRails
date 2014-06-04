require 'spec_helper'

describe 'user controller' do
  before(:each) do
    @user = User.new(name: "Example User", email: "user@example.com") 
    @user.save
  end


  subject { @user }

  describe 'GET /users/:id' do
    before { get "/users/#{@user.id}.json"}
    
    it 'retures the user by :id' do 
      # assert_equal "{\"id\":#{@user.id},\"name\":\"#{@user.name}\",\"email\":\"#{@user.email}\"}", @response.body
      
      response.body.should == {
        'id' => @user.id,
        'name' => @user.name,
        'email' => @user.email
      }.to_json
    end
  end
end
