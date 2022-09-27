class BulkDiscountsController < ApplicationController
    def index
      @merchant = Merchant.find(params[:merchant_id])
    end
  
    def show
      @merchant = Merchant.find(params[:merchant_id])
      @discount = BulkDiscount.find(params[:id])
    end

    def new
    end

    def create
      merchant = Merchant.find(params[:merchant_id])
      merchant.bulk_discounts.create(discount_params)
      redirect_to merchant_bulk_discounts_path(merchant.id)
    end

    def edit
      @merchant = Merchant.find(params[:merchant_id])
      @bulk_discount = BulkDiscount.find(params[:id])
    end

    def update
      @merchant = Merchant.find(params[:merchant_id])
      @bulk_discount = BulkDiscount.find(params[:id])  
      @bulk_discount.update(discount_params)
      redirect_to merchant_bulk_discount_path(@merchant, @bulk_discount)  
    end

    def destroy
      merchant = Merchant.find(params[:merchant_id])
      BulkDiscount.destroy(params[:id])
      redirect_to merchant_bulk_discounts_path(merchant)
    end

    private
    def discount_params
      params.permit(:percentage_discount, :quantity_threshold)
    end
  end 