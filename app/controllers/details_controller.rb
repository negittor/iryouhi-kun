class DetailsController < ApplicationController
  def index
    @details = Detail.all
  end

  def edit
    @detail = Detail.find(params[:id])
  end

  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params)
      redirect_to action: 'index'
    else
      render action: 'edit'
    end
  end

  def destroy
    @detail = Detail.find(params[:id])
    @detail.destroy
    redirect_to details_path
  end

  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect_to action: 'new'
    else
      @amount = Detail.all.sum(:payment)
      render action: 'new'
    end
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
