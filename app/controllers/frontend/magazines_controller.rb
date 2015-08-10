# -*- encoding : utf-8 -*-
class Frontend::MagazinesController < Frontend::BaseController
  def index
    @magazines = Magazine.order(position: :desc)
  end

  def about
  end

  def contact
  end
end