require 'kindle_highlights'

namespace :highlights do
  desc "Get latest Kindle highlights from Amazon"
  task(:kindle => :environment) do
    AMAZON = YAML.load_file("#{Rails.root}/config/amazon.yml")
    kindle = KindleHighlight.new(AMAZON['email'], AMAZON['password'])
    kindle.highlights.each do |highlight|
      book = Book.find_by_amazon_asin(highlight.asin)
      puts "ASIN=#{highlight.asin}"
      unless book.nil? or Post.exists?(["annotation_id = ?", highlight.annotation_id])
        Post.create(:content => highlight.content,
                    :post_type => "quote",
                    :user_id => 1,
                    :book_id => book.id,
                    :annotation_id => highlight.annotation_id)
      end
    end
  end
end
