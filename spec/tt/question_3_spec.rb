# frozen_string_literal: false

RSpec.describe Tt::Grafeno::Question3 do

  it "output format 1" do
    test_input = "97905796671Maria Neusa de00001234"
    expected_output = get_expected_output("format_1")
    test_subject = described_class.new.solution(test_input)

    expect(expected_output).to eq(test_subject)
  end

  it "output format 2" do
    test_input = "44010762900Ricardo Fontes00000567"
    expected_output = get_expected_output("format_2")
    test_subject = described_class.new.solution(test_input)

    expect(expected_output).to eq(test_subject)
  end

  private

  def get_expected_output(format = nil)
    case format
    when "format_1"
      { cpf: "97905796671", name: "Maria Neusa de", value: "1234" }
    when "format_2"
      { cpf: "44010762900", name: "Ricardo Fontes", value: "567" }
    else
      { cpf: "97905796671", name: "Maria Neusa de", value: "1234" }
    end
  end
end
