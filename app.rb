

Tasks = [
    {"id": 1, "title": "Buy almonds"},
    {"id": 2, "title": "Buy Nuts"}
]

class App < Hanami::API
    use Hanami::Middleware::BodyParser, :json
    get "/" do
      "Hello, world"
    end

    get "/tasks" do
       json Tasks
    end

    post "/task" do
        puts params
        
        Tasks.push(params)
        json params
    end 
    
    get "/task/:id" do
        id = params[:id]
        task = Tasks.find{|x| x[:id] == id.to_i}
        json task
    end    
end  