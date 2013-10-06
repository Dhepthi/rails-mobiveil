require 'gcm'
class Api::V1::SessionsController < Api::V1::ApplicationController
  before_filter :ensure_params_exist 

 def reverse_words_sequence
   given_sentence = params["input"]
   reverse_sentence = given_sentence.split(" ").reverse.join(" ")
   render_json(true, {:reversed_sentence => reverse_sentence },200)
 end
  
  def send_push_message
  device_id =["APA91bETu2gpIVv8xCWRPsULPnphGQCCopfmiMPDR-BjA5FQ1bZfmyOvxF9TMR81xnNwAqnzX8wY3RMyAn0cRHzdyyZORwd2QvSYj8d2mSZFgl_Z9BkYG-Su1pCYhdvFDpecVorSrYJcgDaF5bBkhWLVw8CpJ5b6UdcuUmV-iAX0jOoIGtsh5jM"]
   # device_id = [params["input"]]
    api_key = "AIzaSyApSnmGAkK0uDT3Xdx2DrhpYaRU8ITPsKQ" 
    gcm = GCM.new(api_key)
    options = {data: {msg: "my first android push"}, collapse_key: "updated_score"}
    response = gcm.send_notification(device_id, options)
    render_json(true, "Push was successfull",200)
  end
  
  private
  
  def ensure_params_exist
    return if params["input"]
    render_json(true, "Missing user input", 422)
  end


end