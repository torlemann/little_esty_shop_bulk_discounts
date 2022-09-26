require 'rails_helper'

RSpec.describe 'Merchant Bulk Discount Show' do 
  before :each do 
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @bulk_discount_1 = @merchant1.bulk_discounts.create!(percentage_discount: 15, quantity_threshold: 3)

    visit edit_merchant_bulk_discount_path(@merchant1, @bulk_discount_1)
  end

  it 'prepopulates form' do
    expect(page).to have_field("Discount Percentage", with: "#{@bulk_discount_1.percentage_discount}")
    expect(page).to have_field("Quantity Threshold", with: "#{@bulk_discount_1.quantity_threshold}")
  end

  it 'can update discount info' do
    fill_in "Discount Percentage", with: 50
    fill_in "Quantity Threshold", with: 2
    click_button "Submit"

    expect(current_path).to eq(merchant_bulk_discount_path(@merchant1, @bulk_discount_1))
    expect(page).to have_content("Discount: 50%")
    expect(page).to have_content("Quantity Threshold: 2 or more items")
  end
end