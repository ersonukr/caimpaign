class HomeController < ApplicationController
  def index
    
  end
  def api
    call_sid = params[:CallSid]
    phone_number = params[:From].last(10)
    call_status = params[:CallType]
    response = params[:digits]
    if response.present?
      response.gsub!('"','')
    end
    call = Call.find_by_call_sid(call_sid) rescue nil
    if call.nil?
      call = Call.new({:call_sid => call_sid, :phone => phone_number, :response => response}) rescue nil
      if call.present?
        call.set_call_status(call_status)
        call.save
      end
    end
    render :plain => 'success', :status => 200
  end
end