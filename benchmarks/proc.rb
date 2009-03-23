
def yield_or_eval_test &block
  block.yield_or_eval 'foo'
end

def manual &block
  foo = 'foo'
  if block.arity > 0
    yield foo
  else
    foo.instance_eval &block
  end
end

benchmark 'Proc', :times => $times do
  report '#yield_or_eval' do 
    yield_or_eval_test { length }
    yield_or_eval_test { |foo| foo.length }
  end
  report 'manual' do 
    manual { length }
    manual { |foo| foo.length }
  end
end