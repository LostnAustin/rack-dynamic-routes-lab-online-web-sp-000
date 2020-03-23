require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # binding.pry
    if req.path=="/items/".include?("items")
      #  binding.pry
      resp.write "/items/".split(",")
# "/items/fake".include?("items")
    # #
    # elsif req.path!="/items/"
    #   resp.write "Item not found"
    #   resp.status = 400

  else
     resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
