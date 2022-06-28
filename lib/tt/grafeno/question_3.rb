require "yaml"

class Tt::Grafeno::Question3
  PATH = "lib/tt/grafeno/".freeze

  def solution(arg, format_path = "#{PATH}format.yml")
    format_settings = load_format_settings(format_path)
    format_output(arg, format_settings)
  end

  private

  def load_format_settings(format_path)
    YAML.load_file(File.join(format_path))
  end

  def format_output(input, format_settings)
    processing_input = input
    result = {}

    format_settings.each do |key, value|
      processing_input, result[key.to_sym] = format_key(processing_input, value)
    end

    result
  end

  def format_key(input, key_format_options)
    length = key_format_options["length"] || 11
    padding_character = key_format_options["padding"]
    alignment = key_format_options["align"]

    extracted_value = input.slice!(0..length - 1)

    if padding_character == "zeroes"
      if alignment == "right"
        extracted_value.sub!(/^[0]+/, "")
      else
        # TODO: remover os zeros que venham do lado direito da string
      end
    else
      extracted_value.strip!
    end

    [input, extracted_value]
  end
end
