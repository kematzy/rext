
list = %w( just some random foo bar like cookies )

benchmark 'Enumerable#group_by', :times => $times do
  report 'with block' do 
    list.group_by { |item| item.length } 
  end
  report 'with evaled block' do 
    list.group_by { length }
  end
  report 'with proxy' do 
    list.group_by.length
  end
end