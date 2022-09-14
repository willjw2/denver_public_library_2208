class Library
  attr_reader :name, :books, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
    @book_checkout_counters = {}
  end
  def add_author(author)
    @authors << author
    author.books.each {|book| @books << book}
    author.books.each {|book| @book_checkout_counters[book] = 0}
  end
  def publication_time_frame_for(author)
    earliest_book = author.books.min_by {|book| book.publication_year}
    latest_book = author.books.max_by {|book| book.publication_year}
    {start: earliest_book.publication_year, end: latest_book.publication_year}
  end
  def checkout(book)
    if !@books.include?(book)
      false
    elsif @checked_out_books.include?(book)
      false
    else
      @book_checkout_counters[book] += 1
      @checked_out_books << book
      true
    end
  end
  def checked_out_books
    @checked_out_books
  end
  def return(book)
    @checked_out_books.delete(book)
  end
  def most_popular_book
    most_popular = @book_checkout_counters.max_by {|name, checkouts| checkouts}
    most_popular[0]
  end
end
