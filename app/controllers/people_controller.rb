require_relative '../../app/services/people_service'

class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show update destroy ]

  # GET /people?params
  def index
    @people = PeopleService.search(params[:t])

    render json: @people
  end
  
  # GET /people/count
  def count
    total = PeopleService.count()
    render json: total
  end

  # GET /people/1
  def show
    render json: @person
  end

  # POST /people
  def create
    @person = PeopleService.create(person_params, params[:stack])

    if @person.is_a?(Person)
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # GET /people/count
  def search
    @person = PeopleService.search()
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = PeopleService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:nickname, :name, :birth_date)
    end
end
