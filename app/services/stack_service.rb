class StackService
    def self.create_with_person(person_id, stack_names)
        stack_names.each do |stack_name|
          Stack.create(description: stack_name, person_id: person_id)
        end
    end
end