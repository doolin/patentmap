require 'httparty'

class MapsController < ApplicationController
  def index
    lastname = "BAKER"
    firstname = "ROBERT"
    key = "1ssyy5yBbx"
    @response = HTTParty.get("http://patentsnapper.com/api/invpats?lastname=#{lastname}&firstname=#{firstname}&key=#{key}")
  end
end
