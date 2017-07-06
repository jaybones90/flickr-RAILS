class PagesController < ApplicationController

  def home
    @images = Image.all.take(30)
  end

end
