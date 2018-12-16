# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :system do
  scenario 'visits home page' do
    visit root_path
    expect(page).to have_content 'bière'
  end

  context 'Testing links on homepage' do
    scenario 'visits home page, checks link for users' do
      visit root_path
      have_link 'Se connecter', href: new_user_session_path
      have_link "S'enregistrer", href: new_user_registration_path
    end

    scenario 'visits home page, checks link for barmen' do
      visit root_path
      have_link 'Publiez votre carte', href: new_manager_registration_path
      have_link 'Connectez-vous', href: new_manager_session_path
      have_link 'Nous rejoindre', href: new_manager_registration_path
    end
  end
end
