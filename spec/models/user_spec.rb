require 'spec_helper'

describe User do
  subject(:user) { User.new(name: "Sample", 
  	  				        email: "sample@example.com",
  	  				     password: "foobar",
  	   		password_confirmation: "foobar")
  }

  it { should respond_to(:id) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:chips) }

  it { should be_valid }

  context "with invalid info --" do 
  	context "empty user name" do 
 	  before { user.name = "  " }
 	  it { should_not be_valid }
    end
	
	context "invalid email" do 
  	  address = ["   ", "user@foo,com", "user_at_foo.org", 
  	  	       "example.user@foo.", "foo@bar_baz.com", 
  	  	       "foo@bar+baz.com", "foo@bar..com"]

  	  address.each do |invalid_address|
  	    context "as \"#{invalid_address}\"" do
  	  	  before { user.email = invalid_address }
  	  	  it { should_not be_valid }
  	    end
  	  end 
  	end

	context "existing email" do
  	  before { Fabricate(:user) }
  	  it { should_not be_valid }
  	end

  	context "empty password" do 
  	  subject { @user = User.new(name: "No Password", 
  	  				    		email: "sample@example.com",
  	  				 		 password: "",
  	   			password_confirmation: "foobar")
 	  }

 	  it { should_not be_valid }
  	end

  	context "non match password" do 
  	  subject { @user = User.new(name: "Bad Password", 
  	  				    		email: "sample@example.com",
  	  				 		 password: "foobar",
  	   			password_confirmation: "      ")
 	  }

 	  it { should_not be_valid }
  	end 
  end
  
  context "with valid emials" do 
	address = %w[user@foo.COM A_US-ER@f.b.org 
		         frst.lst@foo.jp a+b@baz.cn]

	address.each do |valid_address|
  	  context "as \"#{valid_address}\"" do
  	  	before { user.email = valid_address }
  	  	it { should be_valid }
  	  end
  	end     
  end

  context "with mixed case email" do 
  	let(:mixed_case_email) { "Foo@ExAMPle.CoM" }

    it "should be saved as all lower-case" do
      user.email = mixed_case_email
      user.save
      expect(user.reload.email).to eq mixed_case_email.downcase
    end 
  end

  describe ".remember_token" do
    before { user.save }
    its(:remember_token) { should_not be_blank }
  end


end
