Rails.application.routes.draw do

  get("/forex", { :controller => "currency", :action => "first_page" })
  get("/forex/:from_currency", { :controller => "currency", :action => "second_page" })
  get("/forex/:from_currency/:to_currency", { :controller => "currency", :action => "result_page" })

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
