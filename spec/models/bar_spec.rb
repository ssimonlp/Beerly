# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bar, type: :model do
<<<<<<< HEAD

  describe 'Validations' do 

    context "When a manager wants to update his bar" do 
    
      before do 
        @manager = Manager.new(email:'juliette@gmail.com', password:'123456', password_confirmation:'123456')
        @manager.skip_confirmation!
        @manager.save
=======
  describe 'Validations' do
    context 'When a manager wants to update his bar' do
      before do
        @manager = Manager.create(email: 'juliette@gmail.com', password: '123456', password_confirmation: '123456')
>>>>>>> dev
        @bar = Bar.new(manager_id: @manager.id)
        @bar.save(validate: false)
      end

      it 'should raise error when the manager update a bar without a name' do
        expect { @bar.update!(address: '17 Rue Breguet, 75011 Paris') }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'should raise error when the manager update a bar without an address' do
        expect { @bar.update!(name: 'Le Grand Bréguet') }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'relations' do
    context 'When testing what the bar should have' do
      before do
        @bar = Bar.last
<<<<<<< HEAD
      end 
      
      it 'should be able to have many Beers through beerlists' do 
=======
      end

      it 'should have many Beers through beerlists' do
>>>>>>> dev
        expect { @bar.beer }.to raise_error(NoMethodError)
        expect(@bar.beers).not_to be_empty
      end

<<<<<<< HEAD
      it 'should be able to have many beerlists' do 
=======
      it 'should have many beerlists' do
>>>>>>> dev
        expect { @bar.beer_list }.to raise_error(NoMethodError)
        expect(@bar.beer_lists).not_to be_empty
      end

      it 'should belong to one barman only' do
        expect { @bar.managers }.to raise_error(NoMethodError)
      end
    end
  end
end
