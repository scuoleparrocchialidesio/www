# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

projects = [
  {
    cover: 'https://images.unsplash.com/photo-1542627250-da40d2d18228?fit=crop',
    title: 'Progetto 1',
    date: '03/07/2019',
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    slug: 'progetto_1',
  },
  {
    cover: 'https://images.unsplash.com/photo-1535209039648-9524289505fd?fit=crop',
    title: 'Progetto 2',
    date: '03/07/2019',
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    slug: 'progetto_2',
  },
  {
    cover: 'https://images.unsplash.com/photo-1542627250-da40d2d18228?fit=crop',
    title: 'Progetto 3',
    date: '03/07/2019',
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.<br /> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    slug: 'progetto_3',
  },
  {
    cover: 'https://images.unsplash.com/photo-1535209039648-9524289505fd?fit=crop',
    title: 'Progetto 4',
    date: '03/07/2019',
    text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    slug: 'progetto_4',
  },
]

[
  {
    slug: 'san_giorgio',
    label: 'San Giorgio',
    cover: 'example1.jpg',
  },
  {
    slug: 'san_giuseppe',
    label: 'San Giuseppe',
    cover: 'example2.jpg',
  },
  {
    slug: 'san_vincenzo',
    label: 'San Vincenzo',
    cover: 'example3.jpg',
  },
].each do |school|
  proxy(
    "/scuole/#{school[:slug]}.html",
    '/scuole/school.html',
    locals: {
      school: school,
      projects: projects,
    },
  )
  proxy(
    "/scuole/#{school[:slug]}/eventi.html",
    '/scuole/events.html',
    locals: {
      school: school,
      projects: projects,
    },
  )
  proxy(
    "/scuole/#{school[:slug]}/progetti_in_corso.html",
    '/scuole/projects.html',
    locals: {
      school: school,
      projects: projects,
    },
  )
  projects.each do |project|
    proxy(
      "/scuole/#{school[:slug]}/progetti_in_corso/#{project[:slug]}.html",
      '/scuole/project.html',
      locals: {
        school: school,
        project: project,
      },
    )
  end
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
