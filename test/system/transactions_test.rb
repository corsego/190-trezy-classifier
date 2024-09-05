require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "should create transaction" do
    visit transactions_url
    click_on "New transaction"

    fill_in "Amount", with: @transaction.amount
    fill_in "Currency", with: @transaction.currency
    fill_in "Description", with: @transaction.description
    fill_in "Direction", with: @transaction.direction
    fill_in "Transaction date", with: @transaction.transaction_date
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "should update Transaction" do
    visit transaction_url(@transaction)
    click_on "Edit this transaction", match: :first

    fill_in "Amount", with: @transaction.amount
    fill_in "Currency", with: @transaction.currency
    fill_in "Description", with: @transaction.description
    fill_in "Direction", with: @transaction.direction
    fill_in "Transaction date", with: @transaction.transaction_date.to_s
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Transaction" do
    visit transaction_url(@transaction)
    click_on "Destroy this transaction", match: :first

    assert_text "Transaction was successfully destroyed"
  end
end
