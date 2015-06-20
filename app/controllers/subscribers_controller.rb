class SubscribersController < ApplicationController
  
  EMAIL_REGEX = /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  respond_to :html

  def create
    if params['NAME'].present? && params['EMAIL'].present? && params['EMAIL'] =~ EMAIL_REGEX
      mailchimp = Gibbon::API.new
      begin
        mailchimp.lists.subscribe({id: params[:id], email: {email: params['EMAIL']}, merge_vars: {:NAME => params['NAME'], :ORIGIN => params['ORIGIN'], :CAMPAIGN => params['CAMPAIGN'], :AD => params['AD'], :NAMESPACE => params['NAMESPACE'], :CONTROLLER => params['CONTROLLER'], :ACTION => params['ACTION'], :LOCALE => params['LOCALE'], :TITLE => params['TITLE'], :TEXT => params['TEXT'], :TEXTMD5 => params['TEXTMD5'], :CALLTOACT => params['CALLTOACT'], :INSTRUCT => params['INSTRUCT'], :BUTTON => params['BUTTON']}, double_optin: false})
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
