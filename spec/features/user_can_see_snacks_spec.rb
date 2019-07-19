require 'rails_helper'

RSpec.describe "As a user", type: :feature do
  it "When I visit a vending machine show page, I see the name of all of the snacks associated with that vending machine along with their price" do
    owner = Owner.create(name: "Sam's Snacks")
    owner_2 = Owner.create(name: "Steve's Snacks")
    steve = owner_2.machines.create(location: "Snack Time")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack_1 = dons.snacks.create(name: "Snickers", price: 2)
    snack_2 = dons.snacks.create(name: "Cola", price: 4)
    snack_3 = steve.snacks.create(name: "Apple", price: 5)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content("Snickers")
    expect(page).to have_content(2)
    expect(page).to_not have_content("Apple")
    expect(page).to_not have_content("Snack Time")
    expect(page).to have_content("Average Price")
    expect(page).to have_content("3")
  end
end
