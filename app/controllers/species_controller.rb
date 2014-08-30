class SpeciesController < ApplicationController

  def index
    @species = []
    @species = Specie.all.order(:name)
    render('/species/index.html.erb')
  end

  def new
    @specie = Specie.new
    render('species/new.html.erb')
  end

  def create
    @specie = Specie.new(:name=>params[:name])
    if @specie.save
      render('species/success.html.erb')
    else
      render('species/new.html.erb')
    end
  end

  def edit
    @specie = Specie.find(params[:id])
    @sightings = @specie.sightings.where(:specie_id=>@specie.id)
    render('species/edit.html.erb')
  end

  def update
    @specie = Specie.find(params[:id])
    if @specie.update(params[:name])
      render('species/updated.html.erb')
    else
      render('species/edit.html.erb')
    end
  end

  def destroy
    @specie = Specie.find(params[:id])
    @sightings = @specie.sightings.where(:specie_id=>@specie.id)
    @sightings.each do |sighting|
      sighting.destroy
    end
    @specie.destroy
    render('species/destroyed.html.erb')
  end
end
