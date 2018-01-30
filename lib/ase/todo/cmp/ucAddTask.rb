module Ase
  module Todo
    module Cmp
      module UseCases
        class AddTask
          def self.add(title, job: '')
            task = Entities::Task.new(title: title, job: job)

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

