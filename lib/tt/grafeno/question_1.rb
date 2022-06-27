class Tt::Grafeno::Question1
  def solution(arg)
    arg.map(&method(:format_output)).join("\n")
  end

  private

  def format_output(input)
    %i[name cpf state value].map do |key|
      adjust_length(input[key])
    end.join
  end

  def adjust_length(value)
    value[0..10].ljust(11, ' ')
  end
end
