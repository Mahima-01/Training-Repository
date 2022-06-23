class DemoController < ApplicationController
  def index
    #render('demo/index')
    render('hello') # This will return code written in hello,i.e This is hello page.
  end

  def hello
    #render('hello')
    render('index') # This will return code written in index.
  end
end
