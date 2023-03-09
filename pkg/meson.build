pkg_gtk4d_conf = import('pkgconfig')

pkg_gtk4d_conf.generate(gtk4d_lib,
    name: 'gtk4d',
    subdirs: 'd/gtk4d',
    version: meson.project_version(),
    requires: gtk4d_dependencies,
    description: 'Gtk4D is a gtk4.0 wrapper for the D language.')
