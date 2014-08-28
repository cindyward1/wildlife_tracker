Rails.application.routes.draw do
  match('sightings', {:via=>:get, :to=>'sightings#index'})
  match('sightings', {:via=>:post, :to=>'sightings#create'})
end
