class JobsController < ApplicationController
    before_action :authenticate_user!, only:[:new, :create, :edit, :updata, :destroy]

  def index
    @ jobs = Job.all
  end

  def new
    @ job = Job.new
  end

  def edit
    @ job = Job.find(params[:id])
  end

  def show
    @ job = Job.find(params[:id])
  end

  def create
    @ job = Job.new(job_params)

    if @job.save
       redirect_to jobs_path
    else
       render :new
    end
  end

  def udpate
    @ job = Job.find(params[:id])

    if @job.update
       redirect to jobs_path(job_params), alert : "update successfully"
    else
       render :edit
    end
  end

  def destroy
    @ job = Job.find(params[:id]), warning: "deleted"
    @ job.destroy
  end

  private

  def job_params
    params.require(:job).permit[:title, :description]
  end

end
