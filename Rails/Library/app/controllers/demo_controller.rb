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

  def about
    render('about')
  end

  def contact_us
    if['us', 'ca'].include?(params[:country])
      @phone = "(800) 555-6789"
    elsif params[:country] == 'uk'
      @phone = "(020) 7946 1234"
    else
      @phone = "+1 (987) 654-3210"
    end
    render("contact_us")
  end
end
