class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "secret",
    password: "pass",
    except: [
      :index,
      :show
    ]

  def index
    @articles = Article.all
    @rpc_response = ping_rpc_request
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new,
        status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit,
        status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def ping_rpc_request
      url = "http://secretnamebasis.site:10102/json_rpc"
      method = 'DERO.Ping'
      params = nil
      dero_rpc_controller = DeroRpcController.new(url, method, params)
      dero_rpc_controller.send_request['result']
    end

    def article_params
      params.require(:article).permit(
        :title,
        :body,
        :status
        )
    end
end
