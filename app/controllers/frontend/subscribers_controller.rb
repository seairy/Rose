# -*- encoding : utf-8 -*-
class Frontend::SubscribersController < Frontend::BaseController
  def toggle
    @subscriber = Subscriber.toggle(params[:email])
    if @subscriber.available?
      render json: AjaxMessenger.new(t('view.email.subscribed'))
    else
      render json: AjaxMessenger.new(t('view.email.unsubscribed'))
    end
  end
end