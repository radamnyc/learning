require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Welcome to Feed Me See More')
    end
    
    it "should have the right title" do
      visit root_path
      expect(page).to have_title("Feed Me See More | Home")
    end
  end
 
  describe "Help page" do
 
     it "should have the content 'Help'" do
       visit help_path
       expect(page).to have_content('Help page')
     end
    
     it "should have the right title" do
      visit help_path
      expect(page).to have_title("Feed Me See More | Help")
    end
  end
   
  describe "About page" do

    it "should have the content 'This is the About page'" do
      visit about_path
      expect(page).to have_content('This is the About page')
    end
    
    it "should have the right title" do
      visit about_path
      expect(page).to have_title("Feed Me See More | About")
    end

  end   
      
end
