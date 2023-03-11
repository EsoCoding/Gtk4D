gtk4d_lib = library('gtk4d',
    sources: [gtkd, adw,adwc, atk, atkc, cairo, cairoc, gdk, gdkc, gdkpixbuf, gdkpixbufc, gio, gioc, glib, glibc, gobject, gobjectc, graphene, graphenec, 
        	gsk, gskc, gthread, gthreadc, gtk, gtkc, harfbuzz, harfbuzzc, pango, pangoc, rsvg, rsvgc, shumate, shumatec, soup, soupc, sourceview, sourceviewc],
    include_directories: [inc, libinc, localinc],
    dependencies: gtk4d_dependencies,
    install: true,
    soversion: project_soversion,
    version: meson.project_version())