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
      if params[:status]
        redirect_to merchant_bulk_discounts_path(@merchant)
      elsif (params[:percentage_discount].blank? || params[:quantity_threshold].blank?)
        redirect_to edit_merchant_bulk_discount_path(@merchant, @bulk_discount), alert: "Error: all fields must be filled in with integer"
      else
        redirect_to merchant_bulk_discount_path(@merchant, @bulk_discount), notice: "Update successful"
      end
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