def hello
  ARGV.each do |name|
    puts "Hello #{name}!"
  end
end

hello
