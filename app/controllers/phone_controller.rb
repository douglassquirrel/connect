class PhoneController < ApplicationController
  # GET /phone.vxml
  def phone
    respond_to do |format|
      format.voicexml # phone.voicexml.rxml
    end
  end
end
