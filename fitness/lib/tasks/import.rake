task :greet do
  puts "Hello world"
  def my_logger
    @@my_logger ||= Logger.new("#{Rails.root}/log/my.log")

  end
  my_logger.info("Importer ran")
end