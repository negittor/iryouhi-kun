class DetailsController < ApplicationController
  def index
    @details = Detail.all
  end

  def show
  end

  def update
  end

  def destroy
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
