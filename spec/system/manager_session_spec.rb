require 'rails_helper'

RSpec.describe 'Manager Session', type: :system do

  before :each do
    @manager = Manager.new(email: "manager@gmail.com", password: "123456", password_confirmation: "123456")
    @manager.skip_confirmation!
    @manager.save  
    @bar = Bar.new(manager_id: @manager.id)
    @bar.save(validate: false)
  end

  it "signs manager in" do
    visit new_manager_session_path
    fill_in 'manager_email', with: 'manager@gmail.com'
    fill_in 'manager_password', with: '123456'
    click_button 'Se connecter'
    expect(page).to have_content 'Mon bar'
  end

end