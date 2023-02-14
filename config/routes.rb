Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})

  get("/photos", { :controller => "photos", :action => "index"})
end
