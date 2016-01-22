class String
  def with_wp
    self.gsub(/(http:\/\/7xj43y\.com1\.z0\.glb\.clouddn\.com\/assets%2Fcontent_[^"]*)/) {|url| "#{url}-WithWP"}
  end
end