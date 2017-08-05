# Leverage splat instead of traditional splicing

first, *rest = ARGV

rest.each do |name|
  puts "#{first} #{name}"
end
