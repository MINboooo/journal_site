class ArticlesController < ApplicationController

  def show
      # articleモデルのfindメソッドを使用して、パラメータの値に一致  るidのデータを検索している
      # 取得したデータを@articleというインスタンス変数にセットする
      @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end
