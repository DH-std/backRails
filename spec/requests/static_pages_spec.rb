require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "home page" do
  	it "should have the title" do
      visit root_path
      expect(page).to have_title('BackRails')
  	end
  end
end
