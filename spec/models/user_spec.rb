require 'spec_helper'

describe User do
  before { @player = User.new(name: "Example User", email: "user@example.com") }

  subject { @player }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:passward_digest) }
end
