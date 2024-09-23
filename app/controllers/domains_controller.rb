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
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end
end
