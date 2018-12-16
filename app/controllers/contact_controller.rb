# frozen_string_literal: true

class ContactController < ApplicationController
  def create
    AdminMailer.contact(contact_params).deliver_now
    flash[:info] = 'Email envoyé'
    redirect_to contact_index_path
  end

  private

  def contact_params
    params.permit(:name, :email, :message)
  end
end
