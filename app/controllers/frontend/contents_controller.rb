# -*- encoding : utf-8 -*-
class Frontend::ContentsController < Frontend::BaseController
  def experts
    @experts = Expert.all
  end

  def about
  end

  def contact
  end
end