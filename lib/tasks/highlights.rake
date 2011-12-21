namespace :highlights do
  desc "Get latest Kindle highlights from Amazon"
  task(:kindle => :environment) do
    kindle = KindleHighlight.new(AMAZON['email'], AMAZON['password'])
    kindle.highlights.each do |highlight|
      book = Book.find_by_amazon_asin(highlight.asin)
      unless book.nil? and !Post.exists?(["annotation_id = ?", highlight.annotation_id])
        Post.create(:content => highlight.content,
                    :post_type => "quote",
                    :user_id => 1,
                    :book_id => book.id,
                    :annotation_id => highlight.annotation_id)
      end
    end
  end
end