
class App < Hanami::API
    list_tasks = [
        {"id": 1, "title": "Buy almonds"},
        {"id": 2, "title": "Buy Nuts"}
    ]
    use Hanami::Middleware::BodyParser, :json

    get "/" do
      "Hello, world"
    end

    get "/tasks" do
       json list_tasks
    end

    post "/task" do
        puts params
        
        list_tasks.push(params)
        json params
    end 
    
    get "/task/:id" do
        id = params[:id]
        task = list_tasks.find{|x| x[:id] == id.to_i}

        if task == nil
            json ({status: status(404), error: "not_found", message: "Entry #{params[:id]} not found"})
    
        else
            json task
               
        end  
       
    end
    
    put "/task/:id" do
        id = params[:id]
        task = list_tasks.find{|x| x[:id] == id.to_i}

        if task == nil
            json ({status: status(404), error: "not_found", message: "Entry #{params[:id]} not found"})
    
        else
            
            
            json list_tasks[list_tasks.rindex(task)] = params
               
        end  
    end  
    
    delete "/task/:id" do
        id = params[:id]
        task = list_tasks.find{|x| x[:id] == id.to_i}

        if task == nil
            json ({status: status(404), error: "not_found", message: "Entry #{params[:id]} not found"})
    
        else
            
            list_tasks.delete_at(list_tasks.rindex(task))
            json(message: "Task deleted")
        end
    end    
end  