# -*- encoding : utf-8 -*-
class APIError
  @contents = {
    10001 => { status: 401, message: 'Token失效' },
    10002 => { status: 404, message: '数据未找到' },
    10003 => { status: 403, message: '访问非当前用户数据' },
    10004 => { status: 404, message: 'API不存在' },
    10005 => { status: 408, message: '请求超时' }
  }

  class << self
    def method_missing(sym, *args, &block)
      if sym =~ /^code_\d{5}$/
        content = @contents[sym.to_s.scan(/^code_(\d{5})$/)[0][0].to_i]
        content.merge!(status: 200) unless content.has_key?(:status)
        content
      else
        super(sym, *args, &block)
      end
    end

    def message(code)
      @contents[code][:message]
    end
  end
end
