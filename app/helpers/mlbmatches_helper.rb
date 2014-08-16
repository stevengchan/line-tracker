module MlbmatchesHelper

  def format_line(line)
    formatted_line = line.to_s
    formatted_line.prepend('+') if line > 0
    formatted_line = '-' if line == 0
    return formatted_line
  end
end