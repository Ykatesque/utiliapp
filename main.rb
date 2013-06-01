require "sinatra"
require "sinatra/reloader"
require "movies"
require "stock_quote"
require "image_suckr"
require "pry"

get "/" do
	@home = true
	erb :index
end

get "/movies" do
	erb :movies
end

get "/stocks" do

	erb :stocks

end


get "/images" do

	erb :images

end	

get "/movie_results" do

	@name = params["name"]
	@results = Movies.find_by_title(@name)

	

	erb :movie_results

end



get "/images_results" do 


	suckr = ImageSuckr::GoogleSuckr.new 
	@query = params["name"]

	@query_results = suckr.get_image_url({"q" => "#{@query}"}) 


	erb :images_results

end