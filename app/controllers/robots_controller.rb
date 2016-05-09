class RobotsController < ApplicationController
  def index
    @robots = Robot.all
  end

  def show
    @robot = Robot.find(params[:id])
  end

  def new
    @robot = Robot.new
  end

  def create
    robot = Robot.create(name: robot_params[:name])
    robot.abilities.create(name: robot_params[:abilities])
    if robot.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def robot_params
    params.require(:robot).permit(:name, :abilities)
  end
end
