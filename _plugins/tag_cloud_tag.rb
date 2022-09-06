module Jekyll
  class TagCloudTag < Liquid::Tag
    safe = true
    
    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      html = ''
      topics_frequency = extract_topics_frequency(context.registers[:site].posts)
      font_size_percents = get_topics_font_size_percents(topics_frequency)
      topics = topics_frequency.keys
      topics.each do |tag|
        html << "<span class='tag-cloud-item' style='font-size: #{sprintf("%d", font_size_percents[tag])}%'><a href='/tags/#{tag}/'>#{tag}</a></span>\n"
      end
      html
    end

    private

    TOPIC_REGEXP = Regexp.new('topic:([a-z0-9]+)', Regexp::MULTILINE)
    MIN_FONT_SIZE_PERCENT = 100
    MAX_FONT_SIZE_PERCENT = 500

    def extract_topics_frequency(posts)
      topics = Hash.new(0)
      posts.docs.each do |post|
        post_topics = post.content.scan(TOPIC_REGEXP).flatten
        post_topics.each { |topic| topics[topic] += 1 }
      end
      topics
    end

    def get_topics_font_size_percents(topics_frequency)
      sum = topics_frequency.inject(0) { |sum, topic| sum += topic[1] } 
      avg = sum.to_f / topics_frequency.length
      weights = Hash.new
      topics_frequency.each { |tag| weights[tag[0]] = tag[1] / avg }
      
      min_weight = weights.values.min
      max_weight = weights.values.max
      
      normalized_weights = Hash.new
      weights.each do |weight| 
        normalized_weights[weight[0]] = transform_scale(weight[1], min_weight, max_weight, MIN_FONT_SIZE_PERCENT, MAX_FONT_SIZE_PERCENT)
      end
      normalized_weights
    end

    def transform_scale(val_a, min_a, max_a, min_b, max_b)
      val_n = (val_a - min_a) / (max_a - min_a)
      val_b = (max_b - min_b) * val_n + min_b
      val_b
    end
  end
end

Liquid::Template.register_tag('tag_cloud', Jekyll::TagCloudTag)