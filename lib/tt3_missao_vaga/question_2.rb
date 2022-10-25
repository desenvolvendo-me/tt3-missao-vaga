require "yaml"

class Tt3MissaoVaga::Question2
  PATH = "lib/tt3_missao_vaga/".freeze

  def solution(arg, format_path = "#{PATH}format.yml")
    format_settings = load_format_settings(format_path)

    arg.map do |input|
      format_output(input, format_settings)
    end.join("\n")
  end

  private

  def load_format_settings(format_path)
    YAML.load_file(File.join(format_path))
  end

  def format_output(input, format_settings)
    format_settings.map do |key, key_format|
      format_key(input[key.to_sym], key_format)
    end.join
  end

  def format_key(value, key_format)
    max_length = key_format["length"] || 11
    padding_character = key_format["padding"] == "zeroes" ? "0" : " "
    alignment = key_format["align"]

    truncated_value = value[0..max_length - 1]

    if alignment == "right"
      truncated_value.rjust(max_length, padding_character)
    else
      truncated_value.ljust(max_length, padding_character)
    end
  end
end
