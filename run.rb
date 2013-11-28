require 'thread'

log='log/development.log'
system "truncate --size 0 #{log}"

Thread.new do
  system('bundle exec thin start')
end

args = %W{tail -f #{log}} + [:err => [:child, :out]]

IO.popen(args) do |io|
  begin
    while line = io.gets
      puts line
    end
  rescue Interrupt
  end
end
