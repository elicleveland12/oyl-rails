require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  setup do
    @payment = payments(:one)
  end

  test "visiting the index" do
    visit payments_url
    assert_selector "h1", text: "Payments"
  end

  test "creating a Payment" do
    visit payments_url
    click_on "New Payment"

    fill_in "Card number", with: @payment.card_number
    fill_in "Expiration", with: @payment.expiration
    fill_in "Mechanic", with: @payment.mechanic_id
    fill_in "Name on card", with: @payment.name_on_card
    fill_in "Security code", with: @payment.security_code
    fill_in "User", with: @payment.user_id
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back"
  end

  test "updating a Payment" do
    visit payments_url
    click_on "Edit", match: :first

    fill_in "Card number", with: @payment.card_number
    fill_in "Expiration", with: @payment.expiration
    fill_in "Mechanic", with: @payment.mechanic_id
    fill_in "Name on card", with: @payment.name_on_card
    fill_in "Security code", with: @payment.security_code
    fill_in "User", with: @payment.user_id
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment" do
    visit payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment was successfully destroyed"
  end
end