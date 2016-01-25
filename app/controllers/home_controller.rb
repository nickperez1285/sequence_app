class HomeController < ApplicationController


  def index 
    @picture = [ "home_bike.png","bike1.png", "bike2.png", "bike3.png", "bike4.png"]
    # local version of database
    json_file= open('/Users/Nicks_Home/Desktop/sequence_app/SequenceApp/public/sequence.json').read

    #makes json data accesible within object
    @data =JSON.parse(json_file)

    # arrays for bike info 
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

    # instantiates starting object if not already present 
    if CurrentIndex.all.count == 0 
     @new_index = CurrentIndex.create(:value => 0)
     @new_index.save
   end 

   @index = CurrentIndex.find(1)

end 


  def next 
   @index = CurrentIndex.find(1)
   if  @index.value < 4
     @index.value +=1
     @index.save  
   else 
    @index.value = 0
    @index.save 
  end  
  respond_to do |format|
    format.html {redirect_to :action => "index"}
    format.js 
  end 

end 



def previous
 @index = CurrentIndex.find(1)
 if  @index.value >= 0
   @index.value -=1
   @index.save  
 else 
  @index.value = 0
  @index.save 
end  
respond_to do |format|
  format.html {redirect_to :action => "index"}
  format.js 
end 
end 


private 
def index_params
  params.require(:current_index).permit(:value)
end 











end
