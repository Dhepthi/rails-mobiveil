
class Api::V1::SessionsController < Api::V1::ApplicationController
  before_filter :ensure_params_exist 

 def reverse_words_sequence
   given_sentence = params[:input]
   reverse_sentence = given_sentence.split(" ").reverse.join(" ")
   render_json(true, {"reversed_sentence" => reverse_sentence },200)
 end
  
  private
  
  def ensure_params_exist
    return if params[:input]
    render_json(true, "Missing user input", 422)
  end


end