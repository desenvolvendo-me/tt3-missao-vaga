# frozen_string_literal: true

RSpec.describe Tt3MissaoVaga::Question2 do
  it "output format default" do
    test_input = get_test_input
    expected_output = get_expected_output
    test_subject = described_class.new.solution(test_input)

    expect(expected_output).to eq(test_subject)
  end

  it "output format 1" do
    test_input = get_test_input
    expected_output = get_expected_output("format_1")
    test_subject = described_class.new.solution(test_input, "spec/tt3_missao_vaga/format_1.yml")
    expect(expected_output).to eq(test_subject)
  end

  it "output format 2" do
    test_input = get_test_input
    expected_output = get_expected_output("format_2")
    test_subject = described_class.new.solution(test_input, "spec/tt3_missao_vaga/format_2.yml")
    expect(expected_output).to eq(test_subject)
  end

  private

  def get_test_input
    [
      {
        name: "Maria Neusa de Aparecida",
        cpf: "97905796671",
        state: "Sao Paulo",
        value: "1234"
      },
      {
        name: "Ricardo Fontes",
        cpf: "44010762900",
        state: "Rio Grande do Sul",
        value: "567"
      }
    ]
  end

  def get_expected_output(format = nil)
    case format
    when "format_1"
      "97905796671Maria Neusa de00001234\n44010762900Ricardo Fontes00000567"
    when "format_2"
      "0009790579667100001234Sao Paulo     \n0004401076290000000567Rio Grande do "
    else
      "97905796671Maria Neusa de00001234\n44010762900Ricardo Fontes00000567"
    end
  end
end
