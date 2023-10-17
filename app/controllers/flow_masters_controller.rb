class FlowMastersController < ApplicationController
  # to see all instances
  def index
    rappers = FlowMaster.all
    render json: rappers
  end

  # to save a new instance
  def create
  end

  # to modify an existing instance
  def update
  end

  # to remove an existing instance
  def destroy
  end
end
