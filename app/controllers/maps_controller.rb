require 'httparty'

class MapsController < ApplicationController
  def index
    # lastname = "BAKER"
    # firstname = "ROBERT"
    # key = "1ssyy5yBbx"
 
    lastname = URI.encode(params[:lastname]) if params[:lastname]
    firstname = URI.encode(params[:firstname]) if params[:firstname]
    key = params[:key]
  
    @response = HTTParty.get("http://patentsnapper.com/api/invpats?lastname=#{lastname}&firstname=#{firstname}&key=#{key}")
    
    respond_to do |format|
      format.html # render index.html
      format.json { render json: @response.parsed_response }
    end
  end
end
