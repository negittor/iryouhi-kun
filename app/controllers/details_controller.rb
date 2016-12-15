class DetailsController < ApplicationController
  def index
    @details = Detail.all
  end

  def edit
    @detail = Detail.find(params[:id])
  end

  def update
    @detail = Detail.find(params[:id])
    @detail.update(detail_params)
    redirect_to details_path
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    redirect_to details_path
  end

  def create
    @detail = Detail.new(detail_params)
    @detail.save
    redirect_to action: 'new'
  end

  def new
    @detail = Detail.new

    # calculate amount price
    @amount = Detail.all.sum(:payment)
  end

  private

    def detail_params
      params.require(:detail).permit(:date, :user, :department, :payment)
    end
end
