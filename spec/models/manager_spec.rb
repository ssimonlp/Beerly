require 'rails_helper'

RSpec.describe Manager, type: :model do

  describe 'relations' do 

    before do 
      @manager = Manager.new(email: "user@gmail.com", password: "123456", password_confirmation: "123456")
      @manager.skip_confirmation!
      @manager.save    
      @bar = Bar.create(manager_id: @manager.id, name:"Kikou", address:"3 villa condorcet, 93400 St-Ouen")
    end 

    it 'should have only one bar' do 
      second_bar = Bar.new(manager_id: @manager.id, name:"Star Wars c'était mieux avant", address:"3 villa condorcet, 93400 St-Ouen")
      expect(second_bar.valid?).to be_falsy
    end
  end 

end
