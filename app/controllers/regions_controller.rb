class RegionsController < ApplicationController

  def index
    @regions = []
    @regions = Region.all.order(:name)
    render('/regions/index.html.erb')
  end

  def new
    @region = Region.new
    render('regions/new.html.erb')
  end

  def create
    @region = Region.new(params[:region])
    if @region.save
      render('regions/success.html.erb')
    else
      render('regions/new.html.erb')
    end
  end

  def edit
    @region = Region.find(params[:id])
    @sightings = @region.sightings.where(:region_id=>@region.id)
    render('regions/edit.html.erb')
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(params[:region])
      render('regions/updated.html.erb')
    else
      render('regions/edit.html.erb')
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @sightings = @region.sightings.where(:region_id=>@region.id)
    @sightings.each do |sighting|
      sighting.destroy
    end
    @region.destroy
    render('regions/destroyed.html.erb')
  end
end
