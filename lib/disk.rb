class Disk < Product
  attr_accessor :genre, :title, :year, :musician

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
       title: lines[0],
       musician: lines[1],
       genre: lines[2],
       year: lines[3],
       price: lines[4],
       amount:lines[5]
    )
  end

  def initialize(params)
    super

    @genre = params[:genre]
    @title = params[:title]
    @year = params[:year]
    @musician = params[:musician]
  end

  def to_s
    "Альбом #{@musician} - \"#{@title}\", #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super

    @genre = params[:genre] if params[:genre]
    @title = params[:title] if params[:title]
    @musician = params[:musician] if params[:musician]
    @year = params[:year] if params[:year]
  end
end