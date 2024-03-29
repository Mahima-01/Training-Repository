class CategoriesController < ApplicationController
    def index
        @category = Category.all
      end
          
      def new
        @category = Category.new
      end
          
      def create
        @category = Category.new(category_params)
        if @category.save
          redirect_to categories_path
        else
          render :new
        end
      end
            
      def show
        @category = Category.includes(:subcategories).find(params[:id])
        @subcategories = @category.subcategories
      end
          
      def edit
        @category = Category.find(params[:id])
      end
          
      def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
          redirect_to(categories_path(@category))
        else
          render(edit)
        end
      end
          
      def destroy
        @category = Student.find(params[:id])
        if @category.destroy
          redirect_to(categories_index_path)
        end
      end
          
      private
      def category_params
        params.require(:category).permit(:name)
      end
          
      def set_category
        params.require(:category).permit(:name)
      end
end
