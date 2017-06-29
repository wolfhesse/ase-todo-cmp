module Ase
  module Todo
    module Cmp
      module UseCases
        class AddTask
          def self.add(title)
            task = Entities::Task.new(title: title)

            if task.valid?
              Ase::Todo::Cmp.repo.persist(task)
            else
              false
            end
          end
        end


      end
    end
  end
end

