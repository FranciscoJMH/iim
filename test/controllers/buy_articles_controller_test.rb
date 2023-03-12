require "test_helper"

class BuyArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @buy_article = buy_articles(:one)
  end

  test "should get index" do
    get buy_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_buy_article_url
    assert_response :success
  end

  test "should create buy_article" do
    assert_difference("BuyArticle.count") do
      post buy_articles_url, params: { buy_article: { article_id: @buy_article.article_id, buy_id: @buy_article.buy_id, quantity: @buy_article.quantity } }
    end

    assert_redirected_to buy_article_url(BuyArticle.last)
  end

  test "should show buy_article" do
    get buy_article_url(@buy_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_buy_article_url(@buy_article)
    assert_response :success
  end

  test "should update buy_article" do
    patch buy_article_url(@buy_article), params: { buy_article: { article_id: @buy_article.article_id, buy_id: @buy_article.buy_id, quantity: @buy_article.quantity } }
    assert_redirected_to buy_article_url(@buy_article)
  end

  test "should destroy buy_article" do
    assert_difference("BuyArticle.count", -1) do
      delete buy_article_url(@buy_article)
    end

    assert_redirected_to buy_articles_url
  end
end
