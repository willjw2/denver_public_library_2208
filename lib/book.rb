class Book
  attr_reader :title, :author, :publication_year
  def initialize(info_hash)
    @title = info_hash[:title]
    @author = "#{info_hash[:author_first_name]} #{info_hash[:author_last_name]}"
    @publication_year = info_hash[:publication_date][-4, 4]
  end
end
