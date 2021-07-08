require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  # * Explicação do comando abaixo -> dependent(:destroy)
  # Caso a categoria seja apagada,
  # todos os registros da tabela product_categories que tenha o ID dela,
  # devem ser apagados também.
  it { is_expected.to have_many(:product_categories).dependent(:destroy) }

  # precisa ter no model uma relação com produtos através da tabela product_categories
  it { is_expected.to have_many(:products).through(:product_categories) }
end
