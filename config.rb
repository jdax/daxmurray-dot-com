# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end
activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false



# dynamic pages for each book 
@app.data.books.each do |b|
  proxy "/#{b.slug}.html", "/book_page.html", :layout => false, :locals => { :b => b }, :ignore => true
end

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end


helpers do
  def get_latest
    @app.data.books.each do |b|
      if b.latest == true
        @latest_release = b
      end
    end
  end

  def get_coming_soon
    @app.data.books.each do |b|
      if b.coming_soon == true
        @coming_soon = b
      end
    end
  end

  def get_scions_series
    @scions_books = Array.new
    @app.data.books.each do |book|
      if book.scions == true
        @scions_books.push(book)
      end
    end
  end

  def get_standalones
    @standalone_books = Array.new
    @app.data.books.each do |book|
      if book.standalone == true
        @standalone_books.push(book)
      end
    end
  end

  def get_poetry
    @poetry_books = Array.new
    @app.data.books.each do |book|
      if book.poetry == true
        @poetry_books.push(book)
      end
    end
  end

end

# activate :deploy do |deploy|
#   deploy.method = :git
#   deploy.branch = 'main'
#   deploy.build_before = true
# end

redirect "resignation-letter.html", to: "/the-magic-surrendered.html"
redirect "the_magic_surrendered.html", to: "the-magic-surrendered.html"
redirect "afterimages.html", to: "shades-and-silver.html"
redirect "shades_and_silver.html", to: "shades-and-silver.html"