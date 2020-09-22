class Book < Product
  attr_accessor :genre, :title, :author

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
        title: lines[0],
        genre: lines[1],
        author: lines[2],
        price: lines[3],
        amount: lines[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга \"#{@title}\", #{@genre}, автор - #{@author}, " + super
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
    @title = params[:title] if params[:title]
    @author = params[:author] if params[:author]
  end
end