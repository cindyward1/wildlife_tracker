require "date"

class SightingsController < ApplicationController

  def index
    @today = Date.today
    @regions = []
    @regions = Region.all.order(:name)
    render('sightings/index.html.erb')
  end

  def create
    @today = Date.today
    @specie = nil
    @specie = Specie.where(:name=>params[:specie_name]).first
    if @specie.nil?
      @specie = Specie.create(:name=>params[:specie_name])
    end
    @region = Region.where(:name=>params[:sighting][:region]).first
    params[:sighting][:specie_id] = @specie.id
    params[:sighting][:region_id] = @region.id
    params[:sighting].delete(:region)
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
    @regions = []
    @regions = Region.all.order(:name)
    @sighting = Sighting.find(params[:id])
    render('sightings/edit.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    @region = Region.where(:name=>params[:sighting][:region]).first
    params[:sighting][:region_id] = @region.id
    params[:sighting].delete(:region)
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
