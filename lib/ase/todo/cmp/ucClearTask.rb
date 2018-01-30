module Ase
  module Todo
    module Cmp
      module UseCases
        class ClearTasks
          def self.execute
            Ase::Todo::Cmp.repo.clear
          end
        end
      end
    end
  end
end