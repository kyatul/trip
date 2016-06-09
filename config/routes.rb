Rails.application.routes.draw do
  namespace :admin do
    resources :destinations, :locations, :reviews
  end

  get 'admin/destination/:destination_id/new_location' => 'admin/locations#new', as: :admin_destination_new_location
  post 'admin/destination/:destination_id/locations' => 'admin/locations#create', as: :admin_destination_locations

  get 'admin/location/:location_id/new_review' => 'admin/reviews#new', as: :admin_location_new_review
  post 'admin/location/:location_id/reviews' => 'admin/reviews#create', as: :admin_location_reviews

  get 'admin/reviews/:id/status' => 'admin/reviews#status', as: :admin_review_status
end
