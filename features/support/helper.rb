def operations(values)
  result = ''

  values.each do |e|
    if e.to_i > 0
      result += "#{e.to_f}"
    else
      case e
      when 'x'
        result += "*"
      when '÷'
        result += "/"
      else
        result += "#{e}"
      end
    end
  end
  eval(result).round(2)
end
