class ArticlesController < ApplicationController

  def show
      # articleモデルのfindメソッドを使用して、パラメータの値に一致  るidのデータを検索している
      # 取得したデータを@articleというインスタンス変数にセットする
      @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)

    # 上の行はインスタンスを作っただけ。saveメソッドで保存しなと、消える。
    @article.save

    # saveの後にshow(商品詳細ページ)に飛ぶ設定をします。
    # これを設定しないと、プログラムが行き場をなくしてエラーが起ます。
    redirect_to @article

    # redirect_to "/articles"
    # だとindexページにリダイレクトする
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
  # params.require(key).permit(filter)
  # key
  #   Strong Parameters を適用したい params の key を指定する。
  # filter
  #   Strong Parameters で許可するカラムを指定する。
  def article_params
    params.require(:article).permit(:title, :body)
  end

end
