gtk4d_lib = library('gtk4d',
    sources: [gtkd, adw, atk, cairo, gdk, gdkpixbuf, gio, glib, gobject, graphene, 
        	gsk, gthread, gtk, harfbuzz, pango, rsvg, shumate, soup, sourceview],
    include_directories: [inc, libinc, localinc],
    dependencies: gtk4d_dependencies,
    install: true,
    soversion: project_soversion,
    version: meson.project_version())