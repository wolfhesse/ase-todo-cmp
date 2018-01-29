module Ase
  module Todo
    module Cmp
      module UseCases
        class ClearTask
          def self.execute
            Ase::Todo::Cmp.repo.clear
          end
        end
      end
    end
  end
end