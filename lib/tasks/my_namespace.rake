require 'fileutils'

namespace :my_namespace do
  desc "Create CSV Files for models"
  task my_task: :environment do
    Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
    dir = "#{Rails.root}/db/csv"
    FileUtils.mkdir(dir) unless Dir.exists?(dir)
    ApplicationRecord.descendants.each do |model|
      puts "----------#{model.to_s.tableize}"
      unless File.exists?("#{dir}/#{model.to_s.tableize}.csv")
        File.open("#{dir}/#{model.to_s.tableize}.csv", 'w+') do |f|
          f.write(model.columns.collect(&:name).join(' '))


        end
        puts "CREATED FILE >> #{model.to_s.tableize}.csv"

      end
      end
  end


end
