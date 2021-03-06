require_relative 'spec_helper'
require_relative '../syntax'

describe 'the syntax of Simple' do
  describe 'expressions' do
    describe 'a variable' do
      subject { Variable.new(:x) }

      its(:name) { should == :x }
      it { should look_like 'x' }
    end

    describe 'a number' do
      subject { Number.new(42) }

      its(:value) { should == 42 }
      it { should look_like '42' }
    end

    describe 'booleans' do
      describe 'true' do
        subject { Boolean.new(true) }

        its(:value) { should == true }
        it { should look_like 'true' }
      end

      describe 'false' do
        subject { Boolean.new(false) }

        its(:value) { should == false }
        it { should look_like 'false' }
      end
    end

    describe 'addition' do
      subject { Additive.new(:+, Number.new(1), Number.new(2)) }

      its(:left) { should == Number.new(1) }
      its(:right) { should == Number.new(2) }
      it { should look_like '1 + 2' }
    end

    describe 'multiplication' do
      subject { Multitive.new(:*, Number.new(2), Number.new(3)) }

      its(:left) { should == Number.new(2) }
      its(:right) { should == Number.new(3) }
      it { should look_like '2 * 3' }
    end

    describe 'less than' do
      subject { Comparison.new(:<, Number.new(1), Number.new(2)) }

      its(:left) { should == Number.new(1) }
      its(:right) { should == Number.new(2) }
      it { should look_like '1 < 2' }
    end
  end

  describe 'statements' do
    describe 'do-nothing' do
      subject { DoNothing.new }

      it { should look_like '...' }
    end

    describe 'assignment' do
      subject { Assign.new(:x, Number.new(5)) }

      its(:name) { should == :x }
      its(:expression) { should == Number.new(5) }
      it { should look_like 'niech x = 5' }
    end

    describe 'sequence' do
      subject { Sequence.new(DoNothing.new, Assign.new(:x, Number.new(1))) }

      its(:first) { should == DoNothing.new }
      its(:second) { should == Assign.new(:x, Number.new(1)) }
      it { should look_like '...; niech x = 1' }
    end

    describe 'if' do
      subject { If.new(Comparison.new(:<, Number.new(3), Number.new(4)), Assign.new(:x, Number.new(3)), Assign.new(:y, Number.new(3))) }

      its(:condition) { should == Comparison.new(:<, Number.new(3), Number.new(4)) }
      its(:consequence) { should == Assign.new(:x, Number.new(3)) }
      its(:alternative) { should == Assign.new(:y, Number.new(3)) }
      it { should look_like 'jezeli (3 < 4) to { niech x = 3 } albo { niech y = 3 }'}
    end
  end
end
