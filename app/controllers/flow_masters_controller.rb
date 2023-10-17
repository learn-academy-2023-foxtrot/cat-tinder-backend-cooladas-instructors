class FlowMastersController < ApplicationController
  # to see all instances
  def index
    rappers = FlowMaster.all
    render json: rappers
  end

  # to save a new instance
  def create
    new_rapper = FlowMaster.create(rapper_params)
    if new_rapper.valid?
      render json: new_rapper
    else
      render json: new_rapper.errors, status: 422
    end
  end

  # to modify an existing instance
  def update
  end

  # to remove an existing instance
  def destroy
  end

  private
  def rapper_params
    params.require(:flow_master).permit(:name, :age, :enjoys, :image)
  end
end
