class UsersController < ApplicationController
  def index

  end
  def create
    # 一旦ここでいろいろやる
    # 1 pyload(object)にユーザー情報を入れる
    # 2 secret keyでobjからtoken(jwt)を生成してクライアントに返す
    # 3 クライアントがCookieにtoken(jwt)を保存
    # 3 以降のアクセスはAuthorizationヘッダーにtoken(jwt)を入れて通信
    # 4 サーバーはjwtを受け取り、secret keyで複合化して検証

  end

  private
    def userparams
      # frontから送るときはpassword?
      params.require(:user).permit(:name, :email, :password_digest)
    end
end
