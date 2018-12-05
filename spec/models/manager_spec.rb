require 'rails_helper'

RSpec.describe Manager, type: :model do
  context 'validation tests' do
    it 'ensures e-mail presence' do
      manager = Manager.new(first_name:'Lucien', last_name:'Passera', password:'1234567', password_confirmation:'1234567').save 
      expect(manager).to eq(false)
    end 

    it 'ensures first_name presence' do
      manager = Manager.new(last_name:'Passera', email:'etudiant.thp@gmail.com', password:'1234567', password_confirmation:'1234567').save 
      expect(manager).to eq(false)
    end 

    it 'ensures last_name presence' do
      manager = Manager.new(first_name:'Lucien', email:'etudiant.thp@gmail.com', password:'1234567', password_confirmation:'1234567').save 
      expect(manager).to eq(false)
    end 

    it 'ensures password presence' do
      manager = Manager.new(first_name:'Lucien', last_name:'Passera', email:'etudiant.thp@gmail.com').save 
      expect(manager).to eq(false)
    end 

    it 'should save successfully' do
      manager = Manager.new(first_name:'Lucien', last_name:'Passera', email:'etudiant.thp@gmail.com',  password:'1234567', password_confirmation:'1234567').save 
      expect(manager).to eq(true)
    end 

  end 

end
