require 'pry'

class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    # binding.pry
    if req.path.include?("items")
      #  binding.pry
      name = req.path.split("items/")[1]

      if item = @@items.find{|item| item.name == name }
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
        resp.write "Route not found"
        resp.status = 404
    end
        resp.finish
  end
end
