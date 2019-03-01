class UsersController < ApplicationController
    before_action :require_user_logged_in,only: [:index, :show]
    before_action :require_user_correspondence, only:[:edit]
    before_action :set_user, only:[:update]
   
    def index
        @users = User.all.page(params[:page])
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
         if @user.update(user_params)
            flash[:success] = "アカウントは正常に更新されました"
            redirect_to @user
        else
            flash.now[:danger] = "アカウントは更新されませんでした"
            render :edit
        end
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            flash[:success] = "ユーザーを登録しました"
            redirect_to @user
        else
            flash.now[:danger] = "ユーザーの登録に失敗しました"
            render :new
        end
    end
    
    
    private
    
    def set_user
        @user = current_user.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    

    
end
