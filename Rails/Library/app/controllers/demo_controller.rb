class DemoController < ApplicationController
  def index
    #render('demo/index')
    #render('hello') # This will return code written in hello,i.e This is hello page.
  end

  def hello
    @array = [1, 2, 3, 4, 5]
    #render('hello')
    #render('index') # This will return code written in index.
    #redirect_to(:controller=> 'demo', :action=> 'index')
    @id = params['id']
    @page = params[:page]
  end
end
