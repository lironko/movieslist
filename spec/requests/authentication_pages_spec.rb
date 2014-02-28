require 'spec_helper'

describe "Authentication" do

	subject {page}

  describe "signin page" do
  	before { visit login_path }

  	describe "with invalid information" do
  		before{ click_button "Login" }

    	it {should have_content('Login')}
    	it {should have_title('Login')}

    	describe "after visiting another page" do 
    		before {click_link "Home"}
    		it {should not have selector('div.alert.alert-error')}
    	end
	end
  end
end
