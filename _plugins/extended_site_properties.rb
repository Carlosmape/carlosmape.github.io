module Jekyll
  class PostWithExtrasGenerator < Generator
    priority :low

    def generate(site)
      # Inicializa los arrays
      languages = []
      technologies = []
      ddbb = []
      ides = []
      os = []

      # Recorrer todos los posts y agregar los valores
      site.posts.docs.each do |post|
        languages.concat(post.data['languages']) if post.data['languages']
        technologies.concat(post.data['technologies']) if post.data['technologies']
        ddbb.concat(post.data['ddbb']) if post.data['ddbb']
        ides.concat(post.data['ides']) if post.data['ides']
        os.concat(post.data['os']) if post.data['os']
      end

      # Eliminar duplicados
      languages.uniq!
      technologies.uniq!
      ddbb.uniq!
      ides.uniq!
      os.uniq!

      # Agregar los arrays a site.data
      site.data['languages'] = languages
      site.data['technologies'] = technologies
      site.data['ddbb'] = ddbb
      site.data['ides'] = ides
      site.data['os'] = os

    end
  end
end

