Rails.application.routes.draw do
  match('sightings', {:via => :get, :to => 'sightings#index'})
  match('sightings', {:via => :post, :to => 'sightings#create'})
  match('sightings/all', {:via => :get, :to => 'sightings#all'})
  match('sightings/:id/edit', {:via => :get, :to => 'sightings#edit'})
  match('sightings/:id', {:via => :patch, :to => 'sightings#update'})
  match('sightings/:id', {:via => :delete, :to => 'sightings#destroy'})
  match('species', {:via => :get, :to => 'species#index'})
  match('species/new', {:via => :get, :to => 'species#new'})
  match('species', {:via => :post, :to => 'species#create'})
  match('species/:id/edit', {:via => :get, :to => 'species#edit'})
  match('species/:id', {:via => :patch, :to => 'species#update'})
  match('species/:id', {:via => :delete, :to => 'species#destroy'})
end
