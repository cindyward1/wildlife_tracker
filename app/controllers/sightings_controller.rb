require "date"

class SightingsController < ApplicationController
  def index
    @today = Date.today
    render('sightings/index.html.erb')
  end

  def create
    @sighting = Sighting.new(params[:sighting])
    @specie = nil
    @specie = Specie.find(:name=>params[:sighting[:name]])
    if @specie == nil
      @specie = Specie.new(:name=>params[:sighting[:name]])
    end
    @sighting.specie_id = @specie.id
    if @specie.save
      render('sightings/success.html.erb')
    else
      render('sightings/index.html.erb')
    end
  end
end
