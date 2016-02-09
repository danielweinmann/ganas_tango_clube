class SubscribersController < ApplicationController
  
  EMAIL_REGEX = /\A([-a-z0-9!\#$%&'*+\/=?^_`{|}~]+\.)*[-a-z0-9!\#$%&'*+\/=?^_`{|}~]+@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  respond_to :html

  def create
    if !params['NAME'].present?
      return alert_and_redirect  "Por favor, informe corretamente seu nome."
    elsif !(params['EMAIL'].present? && params['EMAIL'] =~ EMAIL_REGEX)
      return alert_and_redirect  "Por favor, informe corretamente seu email."
    elsif !params['PHONE'].nil?
      if !params['PHONE'].present?
        return alert_and_redirect  "Por favor, informe corretamente seu telefone."
      elsif params['confirm_purchase'] != '1'
        return alert_and_redirect  "Você precisa confirmar que estará presente no dia do evento para garantir sua vaga."
      end
    end
    mailchimp = Gibbon::API.new
    begin
      mailchimp.lists.subscribe({id: '367de329f4', email: {email: params['EMAIL']}, merge_vars: params.select{|key| key == key.upcase}, double_optin: false, update_existing: true})
    rescue => e
      return alert_and_redirect e.message
    end
    if params[:conversion_value].present?
      @facebook_standard_event = "fbq('track', 'Purchase', {value: '#{ format('%.2f', params[:conversion_value]) }', currency: 'BRL'});"
    else
      @facebook_standard_event = "fbq('track', 'CompleteRegistration');"
    end
  end

  private

  def alert_and_redirect(text)
    form_params = {}
    form_params[:name] = params['NAME'] if params['NAME'].present?
    form_params[:email] = params['EMAIL'] if params['EMAIL'].present?
    form_params[:phone] = params['PHONE'] if params['PHONE'].present?
    flash[:alert] = text
    redirect_to "#{request.env["HTTP_REFERER"]}#{request.env["HTTP_REFERER"].include?('?') ? '&' : '?'}#{form_params.to_param}"
  end

end
