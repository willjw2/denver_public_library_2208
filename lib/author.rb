class Author
  attr_reader :name, :books
  def initialize(name_hash)
    @first_name = name_hash[:first_name]
    @last_name = name_hash[:last_name]
    @name = "#{@first_name} #{@last_name}"
    @books = []
  end
  def write(title, publication_date)
    info_hash = {author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: publication_date}
    book = Book.new(info_hash)
    @books << book
    book
  end
end
