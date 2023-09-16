require_relative 'stack_service'
class PeopleService

    def self.count()
        Person.count
    end

    def self.create(person_params, stack_params)
        @person = Person.new(person_params)
    
        if @person.save
          StackService.create_with_person(@person.id, stack_params) # Crie as stacks associadas à pessoa
          return @person
        end
    
        @person.errors
      end
    

    def self.getAll(person_params)
        Person.all
    end

    def self.find(id)
        Person.find(id)
    end
    
    def self.search(search_param)
        begin
            query1 = Person.select(:id).where("nickname LIKE ? OR name LIKE ?", "%#{search_param}%", "%#{search_param}%")
            query2 = Person.select(:id).joins(:stacks).where("stacks.description LIKE ?", "%#{search_param}%")

             resultados = Person.where(id: query1).or(Person.where(id: query2))
        
        rescue ActiveRecord::RecordNotFound => e
          puts "Erro na consulta: #{e.message}"
        end
    end

end