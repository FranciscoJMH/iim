class BuyArticlesController < ApplicationController
  before_action :set_buy_article, only: %i[ show edit update destroy ]

  # GET /buy_articles or /buy_articles.json
  def index
    @buy_articles = BuyArticle.all
  end

  # GET /buy_articles/1 or /buy_articles/1.json
  def show
  end

  # GET /buy_articles/new
  def new
    @buy_article = BuyArticle.new
  end

  # GET /buy_articles/1/edit
  def edit
  end

  # POST /buy_articles or /buy_articles.json
  def create
    @buy_article = BuyArticle.new(buy_article_params)

    respond_to do |format|
      if @buy_article.save
        format.html { redirect_to @buy_article.buy, notice: "Buy article was successfully created." }
        format.json { render :show, status: :created, location: @buy_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @buy_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buy_articles/1 or /buy_articles/1.json
  def update
    respond_to do |format|
      if @buy_article.update(buy_article_params)
        format.html { redirect_to buy_article_url(@buy_article), notice: "Buy article was successfully updated." }
        format.json { render :show, status: :ok, location: @buy_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @buy_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buy_articles/1 or /buy_articles/1.json
  def destroy
    @buy_article.destroy

    respond_to do |format|
      format.html { redirect_to @buy_article.buy, notice: "Buy article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buy_article
      @buy_article = BuyArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def buy_article_params
      params.require(:buy_article).permit(:buy_id, :article_id, :quantity)
    end
end
