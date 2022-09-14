class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end
  def add_author(author)
    @authors << author
    author.books.each {|book| @books << book}
  end
  def publication_time_frame_for(author)
    earliest_book = author.books.min_by {|book| book.publication_year}
    latest_book = author.books.max_by {|book| book.publication_year}
    {start: earliest_book.publication_year, end: latest_book.publication_year}
  end
end
