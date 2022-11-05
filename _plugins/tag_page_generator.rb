module TagCloudPlugin
  class TagCloudPageGenerator < Jekyll::Generator
    safe true

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, tag, posts)
      end
    end
  end

  # Subclass of `Jekyll::Page` with custom method definitions.
  class TagPage < Jekyll::Page
    def initialize(site, tag, posts)
      @site = site                  # the current site instance.
      @base = site.source           # path to the source directory.
      @tag = tag                    # current tag
      @dir = "tags/#{@tag}"         # the directory the page will reside in.
      @template = 'tag.md'          # page template from _layouts

      # All pages have the same filename, so define attributes straight away.
      @basename = 'index'           # filename without the extension.
      @ext      = '.html'           # the extension.
      @name     = 'index.html'      # basically @basename + @ext.

      load_template()

      self.data['tag'] = @tag
      self.data['articles'] = extract_tags(posts)
    end

    private

    def load_template()
      template_page = @site.pages.find { |page| page.name == @template }
      self.read_yaml(@base, template_page.path)
    end

    def extract_tags(posts)
      articles = Array.new
      posts.each do |post|
        post_articles = post.content
          .split(/---/)
          .select { |article| article.match?(/\[topic:#{ @tag }\]/) }
        articles.push(*post_articles) 
      end
      articles
    end
  end
end
