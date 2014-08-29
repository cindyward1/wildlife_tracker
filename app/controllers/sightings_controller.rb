require "date"

class SightingsController < ApplicationController

  def index
    @today = Date.today
    render('sightings/index.html.erb')
  end

  def create
    @today = Date.today
    @specie = nil
    @specie = Specie.where(:name=>params[:specie_name]).first
    if @specie.nil?
      @specie = Specie.create(:name=>params[:specie_name])
    end
    params[:sighting][:specie_id] = @specie.id
    p params[:sighting]
    @sighting = Sighting.new(params[:sighting])
    if @sighting.save
      render('sightings/success.html.erb')
    else
      render('sightings/index.html.erb')
    end
  end

  def all
    @sightings = Sighting.all.order(:date)
    render('sightings/all.html.erb')
  end

  def edit
    @sighting = Sighting.find(params[:id])
    render('sightings/edit.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(params[:sighting])
      render('sightings/updated.html.erb')
    else
      render('sightings/edit.html.erb')
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    render('sightings/destroyed.html.erb')
  end

end
