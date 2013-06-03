class Array
  def decorate
    map(&:decorate)
  end
end
