Rails.application.routes.draw do
  resources :partners, only: %i[index show create] do
    collection do
      get :geojson
      get :nearest
    end
  end
end
