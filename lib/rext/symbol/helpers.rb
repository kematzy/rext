
class Symbol
  def to_proc
    Proc.new { |object| object.send self }
  end
end