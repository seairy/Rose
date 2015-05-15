# -*- encoding : utf-8 -*-
require 'faker'

namespace :db do
  desc 'Reset the database structure then rebuild and load the seed data'
  task :rebuild do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:clone'].invoke
    Rake::Task['db:seed'].invoke
  end

  desc 'Fill database with fake data'
  task :populate => :environment do |t, args|
    bench = Benchmark.measure do
      50.times do
        post = Post.create!(category: Category.all.sample,
          en_title: Faker::Company.catch_phrase,
          zh_title: Faker::Company.catch_phrase,
          permalink: Faker::Internet.slug,
          cover: fake_image_file,
          en_home_description: Faker::Lorem.paragraph(2),
          zh_home_description: Faker::Lorem.paragraph(2),
          en_description: Faker::Lorem.paragraph(2),
          zh_description: Faker::Lorem.paragraph(2),
          en_content: Faker::Lorem.paragraph(60),
          zh_content: Faker::Lorem.paragraph(60)
        )
        post.publish!
      end
    end
    p "finished in #{bench.real} second(s)"
  end

  def fake_image_file
    abstract_image_filename = File.open(File.join(Rails.root, 'public', 'abstract_images', "#{rand(1..995).to_s.rjust(3, '0')}.jpg"))
  end
end