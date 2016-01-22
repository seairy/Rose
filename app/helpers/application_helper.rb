module ApplicationHelper
  def locale_en?
    I18n.locale == :en
  end

  def locale_zh?
    I18n.locale == :zh
  end
end
