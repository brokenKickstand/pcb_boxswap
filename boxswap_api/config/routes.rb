Rails.application.routes.draw do
    Rails.application.routes.draw do
      namespace :api do
        namespace :v1 do
          post '/signup', to: 'users#create'
        end
      end
    end
end
