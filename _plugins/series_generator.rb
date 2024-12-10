require 'yaml'

module Jekyll
  class SeriesPage < Page
    def initialize(site, base, dir, series_url, series_name)
      @site = site
      @base = base
      @dir = dir
      # name of the output file
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'serie_posts.html')
      self.data['serie_url'] = series_url
      self.data['serie_name'] = series_name
    end
  end

  class SeriesPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'serie_posts'
        dir = 'series'
        series_list = site.posts.docs
            .select { |post| post.data['serie'] && post.data['serie']['url'] && post.data['serie']['name'] }
            .map { |post| post.data['serie'] }
            .compact
            .uniq { |series| series['url'] }

        series_data = series_list.map { |series| { 'url' => series['url'], 'name' => series['name'] } }

        series_data_path = File.join(site.source, '_data', 'series.yml')
        File.open(series_data_path, 'w') { |file| file.write(series_data.to_yaml) }

        series_list.each do |series|
          site.pages << SeriesPage.new(site, site.source, File.join(dir, series['url']), series['url'], series['name'])
        end
      end
    end
  end
end
