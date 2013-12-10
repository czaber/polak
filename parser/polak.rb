# Autogenerated from a Treetop grammar. Edits may be lost.


module Polak
  include Treetop::Runtime

  def root
    @root ||= :statement
  end

  def _nt_statement
    start_index = index
    if node_cache[:statement].has_key?(index)
      cached = node_cache[:statement][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_sequence

    node_cache[:statement][start_index] = r0

    r0
  end

  module Sequence0
    def first
      elements[0]
    end

    def second
      elements[2]
    end
  end

  module Sequence1
    def to_ast
      Sequence.new(first.to_ast, second.to_ast)
    end
  end

  def _nt_sequence
    start_index = index
    if node_cache[:sequence].has_key?(index)
      cached = node_cache[:sequence][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_sequenced_statement
    s1 << r2
    if r2
      if has_terminal?('; ', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('; ')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_sequence
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Sequence0)
      r1.extend(Sequence1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_sequenced_statement
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:sequence][start_index] = r0

    r0
  end

  def _nt_sequenced_statement
    start_index = index
    if node_cache[:sequenced_statement].has_key?(index)
      cached = node_cache[:sequenced_statement][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_assign
    if r1
      r0 = r1
    else
      r2 = _nt_force_assign
      if r2
        r0 = r2
      else
        r3 = _nt_if
        if r3
          r0 = r3
        else
          r4 = _nt_function
          if r4
            r0 = r4
          else
            r5 = _nt_function_call
            if r5
              r0 = r5
            else
              r6 = _nt_do_nothing
              if r6
                r0 = r6
              else
                @index = i0
                r0 = nil
              end
            end
          end
        end
      end
    end

    node_cache[:sequenced_statement][start_index] = r0

    r0
  end

  module Assign0
    def name
      elements[1]
    end

    def assignment_right_side
      elements[5]
    end
  end

  module Assign1
    def to_ast
      Assign.new(name.text_value.to_sym, assignment_right_side.to_ast)
    end
  end

  def _nt_assign
    start_index = index
    if node_cache[:assign].has_key?(index)
      cached = node_cache[:assign][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('niech ', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 6))
      @index += 6
    else
      terminal_parse_failure('niech ')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[a-z]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        r5 = _nt_space
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          if has_terminal?('=', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('=')
            r6 = nil
          end
          s0 << r6
          if r6
            r8 = _nt_space
            if r8
              r7 = r8
            else
              r7 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r7
            if r7
              r9 = _nt_assignment_right_side
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Assign0)
      r0.extend(Assign1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:assign][start_index] = r0

    r0
  end

  module ForceAssign0
    def name
      elements[1]
    end

    def assignment_right_side
      elements[5]
    end
  end

  module ForceAssign1
    def to_ast
      ForceAssign.new(name.text_value.to_sym, assignment_right_side.to_ast)
    end
  end

  def _nt_force_assign
    start_index = index
    if node_cache[:force_assign].has_key?(index)
      cached = node_cache[:force_assign][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('niech! ', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 7))
      @index += 7
    else
      terminal_parse_failure('niech! ')
      r1 = nil
    end
    s0 << r1
    if r1
      s2, i2 = [], index
      loop do
        if has_terminal?('\G[a-z]', true, index)
          r3 = true
          @index += 1
        else
          r3 = nil
        end
        if r3
          s2 << r3
        else
          break
        end
      end
      if s2.empty?
        @index = i2
        r2 = nil
      else
        r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
      end
      s0 << r2
      if r2
        r5 = _nt_space
        if r5
          r4 = r5
        else
          r4 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r4
        if r4
          if has_terminal?('=', false, index)
            r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure('=')
            r6 = nil
          end
          s0 << r6
          if r6
            r8 = _nt_space
            if r8
              r7 = r8
            else
              r7 = instantiate_node(SyntaxNode,input, index...index)
            end
            s0 << r7
            if r7
              r9 = _nt_assignment_right_side
              s0 << r9
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ForceAssign0)
      r0.extend(ForceAssign1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:force_assign][start_index] = r0

    r0
  end

  def _nt_assignment_right_side
    start_index = index
    if node_cache[:assignment_right_side].has_key?(index)
      cached = node_cache[:assignment_right_side][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_function
    if r1
      r0 = r1
    else
      r2 = _nt_expression
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:assignment_right_side][start_index] = r0

    r0
  end

  module If0
    def condition
      elements[1]
    end

    def consequence
      elements[3]
    end

    def alternative
      elements[5]
    end

  end

  module If1
    def to_ast
      If.new(condition.to_ast, consequence.to_ast, alternative.to_ast)
    end
  end

  def _nt_if
    start_index = index
    if node_cache[:if].has_key?(index)
      cached = node_cache[:if][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('jezeli (', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 8))
      @index += 8
    else
      terminal_parse_failure('jezeli (')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_expression
      s0 << r2
      if r2
        if has_terminal?(') to { ', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 7))
          @index += 7
        else
          terminal_parse_failure(') to { ')
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_statement
          s0 << r4
          if r4
            if has_terminal?(' } albo { ', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 10))
              @index += 10
            else
              terminal_parse_failure(' } albo { ')
              r5 = nil
            end
            s0 << r5
            if r5
              r6 = _nt_statement
              s0 << r6
              if r6
                if has_terminal?(' }', false, index)
                  r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
                  @index += 2
                else
                  terminal_parse_failure(' }')
                  r7 = nil
                end
                s0 << r7
              end
            end
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(If0)
      r0.extend(If1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:if][start_index] = r0

    r0
  end

  module Parameter0
    def value
      self.text_value
    end
  end

  def _nt_parameter
    start_index = index
    if node_cache[:parameter].has_key?(index)
      cached = node_cache[:parameter][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[A-z]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:parameter][start_index] = r0

    r0
  end

  module RestParameters0
    def parameter
      elements[2]
    end
  end

  def _nt_rest_parameters
    start_index = index
    if node_cache[:rest_parameters].has_key?(index)
      cached = node_cache[:rest_parameters][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      i1, s1 = index, []
      if has_terminal?(",", false, index)
        r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure(",")
        r2 = nil
      end
      s1 << r2
      if r2
        r4 = _nt_space
        if r4
          r3 = r4
        else
          r3 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r3
        if r3
          r5 = _nt_parameter
          s1 << r5
        end
      end
      if s1.last
        r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
        r1.extend(RestParameters0)
      else
        @index = i1
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

    node_cache[:rest_parameters][start_index] = r0

    r0
  end

  module ParametersList0
    def rest_parameters
      elements[1]
    end
  end

  module ParametersList1
    def value
      self.text_value.chomp.split(",")
    end
  end

  def _nt_parameters_list
    start_index = index
    if node_cache[:parameters_list].has_key?(index)
      cached = node_cache[:parameters_list][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    r2 = _nt_parameter
    if r2
      r1 = r2
    else
      r1 = instantiate_node(SyntaxNode,input, index...index)
    end
    s0 << r1
    if r1
      r3 = _nt_rest_parameters
      s0 << r3
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ParametersList0)
      r0.extend(ParametersList1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:parameters_list][start_index] = r0

    r0
  end

  module Function0
    def pl
      elements[1]
    end

    def body
      elements[3]
    end

  end

  module Function1

    def to_ast
      Function.new(pl.value, body.to_ast)
    end
  end

  def _nt_function
    start_index = index
    if node_cache[:function].has_key?(index)
      cached = node_cache[:function][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('f(', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
      @index += 2
    else
      terminal_parse_failure('f(')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_parameters_list
      s0 << r2
      if r2
        if has_terminal?(') { ', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 4))
          @index += 4
        else
          terminal_parse_failure(') { ')
          r3 = nil
        end
        s0 << r3
        if r3
          r4 = _nt_statement
          s0 << r4
          if r4
            if has_terminal?(' }', false, index)
              r5 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure(' }')
              r5 = nil
            end
            s0 << r5
          end
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Function0)
      r0.extend(Function1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:function][start_index] = r0

    r0
  end

  module FunctionCall0
    def expression
      elements[1]
    end
  end

  module FunctionCall1
  end

  module FunctionCall2
    def name
      elements[0]
    end

    def e
      elements[2]
    end

  end

  module FunctionCall3

    def to_ast
      first = e.elements[0].to_ast rescue []

      actual ||= e.elements[1].elements.inject([first]) do |result, e|
        result << e.elements.last.to_ast
        result
      end.compact.flatten

      FunctionCall.new(name.text_value.to_sym, actual)
    end
  end

  def _nt_function_call
    start_index = index
    if node_cache[:function_call].has_key?(index)
      cached = node_cache[:function_call][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    s1, i1 = [], index
    loop do
      if has_terminal?('\G[a-z]', true, index)
        r2 = true
        @index += 1
      else
        r2 = nil
      end
      if r2
        s1 << r2
      else
        break
      end
    end
    if s1.empty?
      @index = i1
      r1 = nil
    else
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
    end
    s0 << r1
    if r1
      if has_terminal?('(', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
        @index += 1
      else
        terminal_parse_failure('(')
        r3 = nil
      end
      s0 << r3
      if r3
        i4, s4 = index, []
        r6 = _nt_expression
        if r6
          r5 = r6
        else
          r5 = instantiate_node(SyntaxNode,input, index...index)
        end
        s4 << r5
        if r5
          s7, i7 = [], index
          loop do
            i8, s8 = index, []
            if has_terminal?(",", false, index)
              r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure(",")
              r9 = nil
            end
            s8 << r9
            if r9
              r10 = _nt_expression
              s8 << r10
            end
            if s8.last
              r8 = instantiate_node(SyntaxNode,input, i8...index, s8)
              r8.extend(FunctionCall0)
            else
              @index = i8
              r8 = nil
            end
            if r8
              s7 << r8
            else
              break
            end
          end
          r7 = instantiate_node(SyntaxNode,input, i7...index, s7)
          s4 << r7
        end
        if s4.last
          r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
          r4.extend(FunctionCall1)
        else
          @index = i4
          r4 = nil
        end
        s0 << r4
        if r4
          if has_terminal?(')', false, index)
            r11 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure(')')
            r11 = nil
          end
          s0 << r11
        end
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(FunctionCall2)
      r0.extend(FunctionCall3)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:function_call][start_index] = r0

    r0
  end

  module DoNothing0
    def to_ast
      DoNothing.new
    end
  end

  def _nt_do_nothing
    start_index = index
    if node_cache[:do_nothing].has_key?(index)
      cached = node_cache[:do_nothing][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    if has_terminal?('...', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
      r1.extend(DoNothing0)
      @index += 3
    else
      terminal_parse_failure('...')
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r2 = _nt_expression
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:do_nothing][start_index] = r0

    r0
  end

  def _nt_expression
    start_index = index
    if node_cache[:expression].has_key?(index)
      cached = node_cache[:expression][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    r0 = _nt_comparison_operator

    node_cache[:expression][start_index] = r0

    r0
  end

  def _nt_comparison_operator
    start_index = index
    if node_cache[:comparison_operator].has_key?(index)
      cached = node_cache[:comparison_operator][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_less_than
    if r1
      r0 = r1
    else
      r2 = _nt_greater_than
      if r2
        r0 = r2
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:comparison_operator][start_index] = r0

    r0
  end

  module LessThan0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module LessThan1
    def to_ast
      LessThan.new(left.to_ast, right.to_ast)
    end
  end

  def _nt_less_than
    start_index = index
    if node_cache[:less_than].has_key?(index)
      cached = node_cache[:less_than][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_add
    s1 << r2
    if r2
      if has_terminal?(' < ', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure(' < ')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_comparison_operator
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(LessThan0)
      r1.extend(LessThan1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_greater_than
      if r5
        r0 = r5
      else
        r6 = _nt_add
        if r6
          r0 = r6
        else
          @index = i0
          r0 = nil
        end
      end
    end

    node_cache[:less_than][start_index] = r0

    r0
  end

  module GreaterThan0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module GreaterThan1
    def to_ast
      GreaterThan.new(left.to_ast, right.to_ast)
    end
  end

  def _nt_greater_than
    start_index = index
    if node_cache[:greater_than].has_key?(index)
      cached = node_cache[:greater_than][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_add
    s1 << r2
    if r2
      if has_terminal?(' > ', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure(' > ')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_comparison_operator
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(GreaterThan0)
      r1.extend(GreaterThan1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_add
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:greater_than][start_index] = r0

    r0
  end

  module Add0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Add1
    def to_ast
      Add.new(left.to_ast, right.to_ast)
    end
  end

  def _nt_add
    start_index = index
    if node_cache[:add].has_key?(index)
      cached = node_cache[:add][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_multiply
    s1 << r2
    if r2
      if has_terminal?(' + ', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure(' + ')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_add
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Add0)
      r1.extend(Add1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_multiply
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:add][start_index] = r0

    r0
  end

  module Multiply0
    def left
      elements[0]
    end

    def right
      elements[2]
    end
  end

  module Multiply1
    def to_ast
      Multiply.new(left.to_ast, right.to_ast)
    end
  end

  def _nt_multiply
    start_index = index
    if node_cache[:multiply].has_key?(index)
      cached = node_cache[:multiply][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    r2 = _nt_brackets
    s1 << r2
    if r2
      if has_terminal?(' * ', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure(' * ')
        r3 = nil
      end
      s1 << r3
      if r3
        r4 = _nt_multiply
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Multiply0)
      r1.extend(Multiply1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_brackets
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:multiply][start_index] = r0

    r0
  end

  module Brackets0
    def expression
      elements[1]
    end

  end

  module Brackets1
    def to_ast
      expression.to_ast
    end
  end

  def _nt_brackets
    start_index = index
    if node_cache[:brackets].has_key?(index)
      cached = node_cache[:brackets][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    i1, s1 = index, []
    if has_terminal?('(', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('(')
      r2 = nil
    end
    s1 << r2
    if r2
      r3 = _nt_expression
      s1 << r3
      if r3
        if has_terminal?(')', false, index)
          r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(')')
          r4 = nil
        end
        s1 << r4
      end
    end
    if s1.last
      r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
      r1.extend(Brackets0)
      r1.extend(Brackets1)
    else
      @index = i1
      r1 = nil
    end
    if r1
      r0 = r1
    else
      r5 = _nt_term
      if r5
        r0 = r5
      else
        @index = i0
        r0 = nil
      end
    end

    node_cache[:brackets][start_index] = r0

    r0
  end

  def _nt_term
    start_index = index
    if node_cache[:term].has_key?(index)
      cached = node_cache[:term][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0 = index
    r1 = _nt_pstring
    if r1
      r0 = r1
    else
      r2 = _nt_number
      if r2
        r0 = r2
      else
        r3 = _nt_boolean
        if r3
          r0 = r3
        else
          r4 = _nt_variable
          if r4
            r0 = r4
          else
            @index = i0
            r0 = nil
          end
        end
      end
    end

    node_cache[:term][start_index] = r0

    r0
  end

  module Pstring0
    def p
      elements[1]
    end

  end

  module Pstring1
    def to_ast
      PString.new(p.text_value)
    end
  end

  def _nt_pstring
    start_index = index
    if node_cache[:pstring].has_key?(index)
      cached = node_cache[:pstring][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    if has_terminal?('/', false, index)
      r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
      @index += 1
    else
      terminal_parse_failure('/')
      r1 = nil
    end
    s0 << r1
    if r1
      r2 = _nt_p
      s0 << r2
      if r2
        if has_terminal?('/', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure('/')
          r3 = nil
        end
        s0 << r3
      end
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Pstring0)
      r0.extend(Pstring1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:pstring][start_index] = r0

    r0
  end

  module Number0
    def to_ast
      Number.new(text_value.to_i)
    end
  end

  def _nt_number
    start_index = index
    if node_cache[:number].has_key?(index)
      cached = node_cache[:number][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[0-9]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Number0)
    end

    node_cache[:number][start_index] = r0

    r0
  end

  module Boolean0
  end

  module Boolean1
    def to_ast
      Boolean.new(text_value == 'true')
    end
  end

  def _nt_boolean
    start_index = index
    if node_cache[:boolean].has_key?(index)
      cached = node_cache[:boolean][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    i0, s0 = index, []
    i1 = index
    if has_terminal?('true', false, index)
      r2 = instantiate_node(SyntaxNode,input, index...(index + 4))
      @index += 4
    else
      terminal_parse_failure('true')
      r2 = nil
    end
    if r2
      r1 = r2
    else
      if has_terminal?('false', false, index)
        r3 = instantiate_node(SyntaxNode,input, index...(index + 5))
        @index += 5
      else
        terminal_parse_failure('false')
        r3 = nil
      end
      if r3
        r1 = r3
      else
        @index = i1
        r1 = nil
      end
    end
    s0 << r1
    if r1
      i4 = index
      if has_terminal?('\G[a-z]', true, index)
        r5 = true
        @index += 1
      else
        r5 = nil
      end
      if r5
        r4 = nil
      else
        @index = i4
        r4 = instantiate_node(SyntaxNode,input, index...index)
      end
      s0 << r4
    end
    if s0.last
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Boolean0)
      r0.extend(Boolean1)
    else
      @index = i0
      r0 = nil
    end

    node_cache[:boolean][start_index] = r0

    r0
  end

  module Variable0
    def to_ast
      Variable.new(text_value.to_sym)
    end
  end

  def _nt_variable
    start_index = index
    if node_cache[:variable].has_key?(index)
      cached = node_cache[:variable][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[a-z]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(Variable0)
    end

    node_cache[:variable][start_index] = r0

    r0
  end

  def _nt_space
    start_index = index
    if node_cache[:space].has_key?(index)
      cached = node_cache[:space][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\s]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:space][start_index] = r0

    r0
  end

  def _nt_linebreak
    start_index = index
    if node_cache[:linebreak].has_key?(index)
      cached = node_cache[:linebreak][index]
      if cached
        cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
        @index = cached.interval.end
      end
      return cached
    end

    s0, i0 = [], index
    loop do
      if has_terminal?('\G[\\n]', true, index)
        r1 = true
        @index += 1
      else
        r1 = nil
      end
      if r1
        s0 << r1
      else
        break
      end
    end
    if s0.empty?
      @index = i0
      r0 = nil
    else
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
    end

    node_cache[:linebreak][start_index] = r0

    r0
  end

end

class PolakParser < Treetop::Runtime::CompiledParser
  include Polak
end
