class BulkDiscountsController < ApplicationController
    def index
      @merchant = Merchant.find(params[:merchant_id])
    end
  
    def show
      
    end

    def new
    end

    def create
      merchant = Merchant.find(params[:merchant_id])
      merchant.bulk_discounts.create(discount_params)
      redirect_to merchant_bulk_discounts_path(merchant.id)
    end

    private
    def discount_params
      params.permit(:percentage_discount, :quantity_threshold)
    end
  end 