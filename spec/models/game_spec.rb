require 'spec_helper'

describe Game do
  
  # let(:user) {User.new}
  before { @game = Game.new(user_id: 1) }

  subject { @game }

  # User model 
  it { should respond_to(:user_id) }
  it { should respond_to(:game_type) }
  it { should respond_to(:bet) }
  it { should respond_to(:player_hand) }
  it { should respond_to(:dealer_hand) }
  it { should respond_to(:deck) }
end