require 'httparty'

class MapsController < ApplicationController
  def index

    lastname = URI.encode(params[:lastname]) if params[:lastname]
    firstname = URI.encode(params[:firstname]) if params[:firstname]
    key = params[:key]

    query_string = "lastname=#{lastname}&firstname=#{firstname}&key=#{key}"
    @response = HTTParty.get("http://patentsnapper.com/api/invpats?#{query_string}")

    respond_to do |format|
      format.html # render index.html
      format.json { render json: @response.parsed_response }
    end
  end
end
