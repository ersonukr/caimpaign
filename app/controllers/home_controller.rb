class HomeController < ApplicationController
  def index
    @calls = Call.closed_call.page(params[:page]).per(12)
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

  def download_today_calls
    date = params[:call][:created_at]
    if date.present?
      date = Date.parse date
      @calls = Call.where(:created_at => (date.beginning_of_day..date.end_of_day))
      if @calls.present?
        csv = CSV.generate( encoding: 'Windows-1251' ) do |csv|
          # add headers
          csv << ["call_sid","phone","status","Created At"]
          # add data
          @calls.each do |call|
            csv << [call.call_sid, call.phone,call.status,call.created_at]
          end
        end
        send_data csv
      end
    end
  end
  def update_open_calls
    call_sid = params[:call_sid]
    if call_sid.present?
      call = Call.find_by_call_sid(call_sid)
      call.update(closed: true) if call.present?     
    end
  end
end