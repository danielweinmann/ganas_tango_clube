class SubscribersController < ApplicationController
  
  EMAIL_REGEX = /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  respond_to :html

  def create
    if params['NAME'].present? && params['EMAIL'].present? && params['EMAIL'] =~ EMAIL_REGEX
      mailchimp = Gibbon::API.new
      begin
        mailchimp.lists.subscribe({id: params[:id], email: {email: params['EMAIL']}, merge_vars: {:NAME => params['NAME']}, double_optin: false})
      rescue => e
        flash[:alert] = e.message
        return redirect_to :back
      end    
    else
      flash[:alert] = "Você precisa informar seu nome e um email válido para saber mais."
      return redirect_to :back
    end
  end

end
