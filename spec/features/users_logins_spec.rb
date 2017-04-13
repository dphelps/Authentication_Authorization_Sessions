require 'rails_helper'

describe "Authentication" do
   subject {page}
   
   describe "login page" do
     before {visit login_path}
     
     it {should have_title('Log in')}
     it {should have_content("login")}
     
     describe "Invalid Login" do
        before {click_button "Log in"}
        it {should have_title('Log in')}
        it {should have_content('Invalid email/password')}
        
        describe "after visiting another page" do
           before {visit login_path}
           it { should_not have_content('Invalid email/password') }
        end
     end
     
     describe "Valid Login" do
        before do
          @user = User.create(email: "me@me.com", password: "foobar")
          fill_in "Email", with:@user.email
          fill_in "Password", with:@user.password
          click_button "Log in"
        end
        
        it {should have_content('logout')}
        
        describe "should allow logout" do
           before {click_link "logout"}
           it {should have_content("login")}
        end
     end
   end

end