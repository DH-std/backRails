require 'spec_helper'

describe User do
  before { @player = User.new(name: "Example User", email: "user@example.com") }

  subject { @player }

  # User model 
  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:passward_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:chips) }
end
