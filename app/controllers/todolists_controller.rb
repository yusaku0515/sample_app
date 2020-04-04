class TodolistsController < ApplicationController

    def new
         @list = List.new
    end

    # 以下を追加
    def create
        # ストロングパラメーターを使用
         list = List.new(list_params)
        # データベースへ保存する
         list.save
        #詳細画面へリダイレクト
        redirect_to todolist_path(list.id)
    end

    def index
        @lists = List.all
    end

    def show

        @list = List.find(params[:id])
        
    end

    private

    def list_params
        params.require(:list).permit(:title, :body)
    end

end