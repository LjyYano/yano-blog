module Jekyll
  module CDNImageFilter
    OSS_DOMAINS = [
      'gw.alipayobjects.com',
      'gw.alicdn.com',
      'img.alicdn.com'
    ].freeze

    def self.optimize(url)
      return url if url.nil? || url.empty?
      return url if url =~ /\.(svg|gif)$/i
      return url if url.include?('x-oss-process')
      return url unless OSS_DOMAINS.any? { |domain| url.include?(domain) }

      separator = url.include?('?') ? '&' : '?'
      "#{url}#{separator}x-oss-process=image/auto-orient,1/resize,w_2000/format,webp"
    end

    def cdn_image_filter(input)
      input.gsub(/<img\s+[^>]*src="([^"]+)"[^>]*>/) do |img_tag|
        src = $1
        new_src = CDNImageFilter.optimize(src)
        src != new_src ? img_tag.sub(src, new_src) : img_tag
      end
    end

    def cdn_image_url(input)
      CDNImageFilter.optimize(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::CDNImageFilter)
