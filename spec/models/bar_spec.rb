require 'rails_helper'

RSpec.describe Bar, type: :model do
  context 'validation tests' do
    it 'ensures bar has a manager' do
      bar = Bar.new(name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has a name' do 
      bar = Bar.new(manager_id: 1, address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has an address' do 
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has a photo' do 
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has an opening time' do
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has a description' do
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(false)
    end 

    it 'ensures bar has a latitude' do 
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', longitude: '2.000000').save 
      expect(bar).to eq(true)
    end 

    it 'ensures bar has a longitude' do 
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000').save 
      expect(bar).to eq(true)
    end 

    it 'ensures bar saves correctly' do 
      bar = Bar.new(manager_id: 1, name: 'Le Grand Bréguet', address: '17 Rue Breguet, 75011 Paris', photo: 'https://d2ghx89bmumb3r.cloudfront.net/news-upload/2872/le-breguet-lise-lemasson-parisbouge-7-141165496.jpg',opening_time:'Ouvert 7j sur 7, Lundi à mercredi : 8h 0h, Jeudi à samedi : 8h 2h, Dimanche : 8h 20h', description:'Biologique', latitude:'1.0000', longitude: '2.000000').save 
      expect(bar).to eq(true)
    end 
  end   

end


