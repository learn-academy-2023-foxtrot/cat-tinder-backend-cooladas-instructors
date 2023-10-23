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
    edit_rapper = FlowMaster.find(params[:id])
    edit_rapper.update(rapper_params)
    if edit_rapper.valid?
      render json: edit_rapper
    else
      render json: edit_rapper.errors, status: 422
    end
  end

  # to remove an existing instance
  def destroy
    delete_rapper = FlowMaster.find(params[:id])
    rappers = FlowMaster.all
    if delete_rapper.destroy
      render json: rappers
    else
      render json: delete_rapper.errors
    end
  end

  private
  def rapper_params
    params.require(:flow_master).permit(:name, :age, :enjoys, :image)
  end
end
