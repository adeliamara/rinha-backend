class Person < ApplicationRecord
    has_many :stacks, dependent: :destroy # Uma pessoa pode ter muitas stacks
    accepts_nested_attributes_for :stacks # Permite aceitar atributos aninhados para stacks

    def as_json(options = {})
      super(options.merge(
        methods: :stack_names,
        except: [:created_at, :updated_at]
      ))
    end

  # Método para obter os nomes das stacks como uma string separada por vírgula
    def stack_names
      stacks.pluck(:description).join(', ')
    end
end
  