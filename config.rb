# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :dato, live_reload: true, preview: true

# enable livereload on development
configure :development do
  activate :livereload
end

activate :directory_indexes

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

dato.tap do |dato|
  dato.schools.each do |school|
    proxy(
      "/scuole/#{school.slug}/index.html",
      '/scuole/school.html',
      locals: {
        school: school,
      },
      ignore: true,
    )

    proxy(
      "/scuole/#{school.slug}/eventi/index.html",
      '/scuole/events.html',
      locals: {
        school: school,
      },
      ignore: true,
    )

    school.events.each do |event|
      proxy(
        "/scuole/#{school.slug}/eventi/#{event.slug}/index.html",
        '/scuole/event.html',
        locals: {
          school: school,
          event: event,
        },
        ignore: true,
      )
    end

    proxy(
      "/scuole/#{school.slug}/progetti/index.html",
      '/scuole/projects.html',
      locals: {
        school: school,
      },
      ignore: true,
    )

    school.projects.each do |project|
      proxy(
        "/scuole/#{school.slug}/progetti/#{project.slug}/index.html",
        '/scuole/project.html',
        locals: {
          school: school,
          project: project,
        },
        ignore: true,
      )
    end

    proxy(
      "/scuole/#{school.slug}/scuola_in_chiaro/index.html",
      '/scuole/school_in_clear.html',
      locals: {
        school: school,
      },
      ignore: true,
    )

  end

  ignore "/exploratory/calendar/event.html"

  dato.exploratory.events.each do |event|
    proxy(
      "/esploratori/calendario/#{event.slug}/index.html",
      '/exploratory/calendar/event.html',
      locals: { event: event },
      ignore: true
    )
  end
end

proxy(
  "/scuole/index.html",
  '/schools.html',
  ignore: true,
)

proxy(
  "/esploratori/index.html",
  '/exploratory.html',
  ignore: true,
)

proxy(
  "/esploratori/calendario/index.html",
  '/exploratory/calendar.html',
  ignore: true,
)

helpers do
  def format_date(date, format: '%Y-%m-%d')
    date.strftime(format)
  end

  def thumbnail_url(image:)
    "#{image.url}?w=200&h=200&fit=crop"
  end

  def present?(value)
    value && value.strip != ''
  end

  def blank?(value)
    !present?(value)
  end

  def schools_path
    "/scuole"
  end

  def school_path(school)
    "#{schools_path}/#{school.slug}"
  end

  def school_events_path(school)
    "#{school_path(school)}/eventi"
  end

  def school_event_path(school, event)
    "#{school_events_path(school)}/#{event.slug}"
  end

  def school_projects_path(school)
    "#{school_path(school)}/progetti"
  end

  def school_transparency_path(school)
    "#{school_path(school)}/scuola_in_chiaro"
  end

  def school_project_path(school, project)
    "#{school_projects_path(school)}/#{project.slug}"
  end

  def exploratory_path
    '/esploratori'
  end

  def exploratory_calendar_path
    "#{exploratory_path}/calendario"
  end

  def exploratory_calendar_event_path(event)
    "#{exploratory_calendar_path}/#{event.slug}"
  end
end
