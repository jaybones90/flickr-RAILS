class PagesController < ApplicationController

  def home
    @images = Image.not_private.all.reverse.take(30)
  end

end
