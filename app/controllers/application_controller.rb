class ApplicationController < ActionController::Base
  # このファイルは全てのコントローラーが読まれる前に一番はじめに読まれるコード
  # ストロングパラメーターを設定して外部に情報が公開されないように設定している。
  protect_from_forgery with: :exception # クロスサイトリクエストフォージェリ (CSRF)への対応策のコード

  before_action :configure_permitted_parameters, if: :devise_controller? # deviceコントローラーの場合に呼ばれる

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end
