class ActiveRecord::Base
  def urlify(string)
    string = string.gsub(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely (e.g. diacritics).
    string = string.gsub(/[^\w_ \-]+/i, '') # Remove unwanted chars.
    string = string.gsub(/[ \-]+/i, '-') # No more than one of the separator in a row.
    string = string.gsub(/^\-|\-$/i, '') # Remove leading/trailing separator.
    string = string.downcase
    string.size.zero? ? random_permalink(string) : string
    rescue
    random_permalink(string)
  end

  def random_permalink(seed = nil)
    Digest::SHA1.hexdigest("#{seed}#{Time.now.to_s.split(//).sort_by {rand}}")
  end
end