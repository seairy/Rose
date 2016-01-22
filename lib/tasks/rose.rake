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

namespace :data do
  desc 'Migrate the data of posts from original website.'
  task :migrate => :environment do
    bench = Benchmark.measure do
      DB = Sequel.connect(adapter: 'mysql2', host: 'localhost', user: 'root', password: '', database: 'laomao')
      DB[:wp_posts].filter(:post_status => 'publish').filter('post_title <> \'\'').each do |wp_post|
        description = DB[:wp_postmeta].filter(post_id: wp_post[:ID], meta_key: 'short_description').first.try(:[], :meta_value)
        home_description = DB[:wp_postmeta].filter(post_id: wp_post[:ID], meta_key: 'homepage_description').first.try(:[], :meta_value)
        pull_quote = DB[:wp_postmeta].filter(post_id: wp_post[:ID], meta_key: 'pull_quote').first.try(:[], :meta_value)
        Post.create!(category: Category.first,
          en_title: wp_post[:post_title],
          zh_title: wp_post[:post_title],
          permalink: wp_post[:post_name],
          en_description: description,
          en_home_description: home_description,
          en_pull_quote: pull_quote,
          en_content: wp_post[:post_content],
          published_at: wp_post[:post_date]
          )
      end
    end
    p "finished in #{bench.real} second(s)"
  end

  desc 'Migrate data.'
  task :migrate_150608 => :environment do
    bench = Benchmark.measure do
      Post.published.each do |post|
        post.update!(cover: File.open(File.join(Rails.root, 'public', 'post_images', "#{post.id}.jpg")))
      end
    end
    p "finished in #{bench.real} second(s)"
  end
end