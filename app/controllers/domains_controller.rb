class DomainsController < ApplicationController
  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to root_path
    else
      render "new", status: :unprocessable_content
    end
  end

  def show
    @domain = Domain.find(params[:id])
  end

  def update
    @domain = Domain.find(params[:id])
    if @domain.update_attribute(:monitoring, domain_params[:monitoring])
      MonitorJob.perform_later(@domain)
      flash[:notice] = "Monitoring #{@domain.name}"
    else
      flash[:notice] = "Monitoring failed!"
    end
    head :no_content
  end

  private

  def domain_params
    params.require(:domain).permit(:name, :monitoring)
  end
end
