# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def contact(params)
    @sender = params[:name]
    @email = params[:email]
    @message = params[:message]
    # mail(to: "thestudent@gmail.com", subject: "Contact form, from #{@sender}")
  end
end
