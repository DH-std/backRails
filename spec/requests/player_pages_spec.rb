require 'spec_helper'

describe 'player controller' do
  before(:each) do
    @player = User.new(name: "Example User", email: "user@example.com") 
    @player.save
  end


  subject { @player }

  describe 'GET /players/:id' do
    before { get "/players/#{@player.id}.json"}
    
    it 'retures the player by :id' do 
      # assert_equal "{\"id\":#{@player.id},\"name\":\"#{@player.name}\",\"email\":\"#{@player.email}\"}", @response.body
      
      response.body.should == {
        'id' => @player.id,
        'name' => @player.name,
        'email' => @player.email
      }.to_json
    end
  end
end
