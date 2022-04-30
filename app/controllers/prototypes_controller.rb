class PrototypesController < ApplicationController
  before_action :move_to_index, only:[:edit],except:[:index]
  before_action :authenticate_user!, except:[:index,:show]
  

  def index
    @prototypes = Prototype.all.includes(:user)
    if !current_user==nil
    @user = current_user.id
    end
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(get_param)
    if @prototype.id
      redirect_to root_path
   else
     render :new
   end  
  end 

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
      @prototype = Prototype.find(params[:id])
    if  @prototype.update(get_param)
      redirect_to  prototype_path
   else
    render :edit
   end  
  end

   def destroy
     prototype = Prototype.find(params[:id])
     prototype.destroy
     redirect_to  root_path
   end 
 

  def show
    @prototype = Prototype.find(params[:id])
    @user =User.find(@prototype.user_id)
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

    @prototypes = Prototype.all.includes(:user)
  end

  

  private
  def get_param
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id: current_user.id)
  end     #ここで、formでは送信されないデータをmargeメソッドで取得している。

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  # def set_prototype
  #    @prototype = Prototype.find(params[:id])
  # end
end
