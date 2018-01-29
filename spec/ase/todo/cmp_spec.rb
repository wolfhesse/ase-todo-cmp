require_relative '../../spec_helper'

RSpec.describe Ase::Todo::Cmp do
  it 'has a version number' do
    expect(Ase::Todo::Cmp::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end

  describe '.clear' do
    let(:repo) {Ase::Todo::Cmp.repo}

    it 'clears tasks' do
      Ase::Todo::Cmp.add_task 'initial'
      expect {Ase::Todo::Cmp.clear}.
          to change {repo.count}.to(0)
    end
  end

  describe '.add_task' do
    let(:repo) {Ase::Todo::Cmp.repo}

    it 'adds a new task' do
      Ase::Todo::Cmp.clear
      expect {Ase::Todo::Cmp.add_task('speak @ Guru-SP')}.
          to change {repo.count}.by(1)
    end

    it 'adds two new tasks' do
      Ase::Todo::Cmp.clear
      expect {Ase::Todo::Cmp.add_task('speak @ Guru-SP'); Ase::Todo::Cmp.add_task(:another.to_s)}.
          to change {repo.count}.by(2)
    end

    context 'when title is blank' do
      subject(:add_blank_task) {
        Ase::Todo::Cmp.add_task('')
      }

      it 'does not persist' do
        expect {add_blank_task}.to_not change {repo.count}
      end

      it {eq(false)}
    end
  end
end
