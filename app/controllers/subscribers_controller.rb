class SubscribersController < ApplicationController
  
  EMAIL_REGEX = /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  respond_to :html

  def create
    if params['NAME'].present? && params['EMAIL'].present? && params['EMAIL'] =~ EMAIL_REGEX
      mailchimp = Gibbon::API.new
      begin
        mailchimp.lists.subscribe({id: '367de329f4', email: {email: params['EMAIL']}, merge_vars: params.select{|key| key == key.upcase}, double_optin: false, update_existing: true})
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
