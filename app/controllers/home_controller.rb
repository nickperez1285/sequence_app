class HomeController < ApplicationController
  require 'httparty'
  layout 'application'


  def index 
    @picture = [ "home_bike.png", "bike2.png", "bike3.png", "bike4.png"]
    json_file= open('/Users/Nicks_Home/Desktop/sequence_app/SequenceApp/public/sequence.json').read

    @data1 = ActiveSupport::JSON.decode(json_file)
    @data =JSON.parse(json_file)
    @current_item = 0

    @id = []
    @description= []
    @name= []
    @price= []
    @image= []


    @data['products'].collect do |k|
      @id << k['id'] 
      @description<< k['description'] 
      @name<< k['name'] 
      @price<< k['price'] 
      @image<< k['images'] 
    end

  end 

  def update
    respond_to do |format|
      format.json {render json: @current_item}
    end 
  end 

#










end
