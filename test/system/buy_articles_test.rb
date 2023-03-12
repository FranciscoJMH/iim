require "application_system_test_case"

class BuyArticlesTest < ApplicationSystemTestCase
  setup do
    @buy_article = buy_articles(:one)
  end

  test "visiting the index" do
    visit buy_articles_url
    assert_selector "h1", text: "Buy articles"
  end

  test "should create buy article" do
    visit buy_articles_url
    click_on "New buy article"

    fill_in "Article", with: @buy_article.article_id
    fill_in "Buy", with: @buy_article.buy_id
    fill_in "Quantity", with: @buy_article.quantity
    click_on "Create Buy article"

    assert_text "Buy article was successfully created"
    click_on "Back"
  end

  test "should update Buy article" do
    visit buy_article_url(@buy_article)
    click_on "Edit this buy article", match: :first

    fill_in "Article", with: @buy_article.article_id
    fill_in "Buy", with: @buy_article.buy_id
    fill_in "Quantity", with: @buy_article.quantity
    click_on "Update Buy article"

    assert_text "Buy article was successfully updated"
    click_on "Back"
  end

  test "should destroy Buy article" do
    visit buy_article_url(@buy_article)
    click_on "Destroy this buy article", match: :first

    assert_text "Buy article was successfully destroyed"
  end
end
