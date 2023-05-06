# Gtk4D

[Gtk4D](http://www.github.com/gtk-d/gtk-dhttp://www.github.com/gtk-d/gtk4d) is a D language (Digitial Mars D) wrapper for Gtk-4 and other GObject library's like Gio, Shumate, Libsoup etc. Plans are to modernise the wrapper with options like composite templates, so it can compete with other language bindings for gtk like Vala and Python similar wrappers.

### install

To install you need to all the dev packages of the libraries which are listen below in the table:

```
meson setup builddir --prefix=/usr
meson compile -C builddir
meson install -C builddir <-- installs
```

### Included Library's


| Library       | Submodule name | Description                                                                                                                                                                               |
| :-------------- | :--------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Linker        | linker         | A library for dynamic libs loading                                                                                                                                                        |
| GLib          | glib           | GLib is a bundle of three low-level system libraries                                                                                                                                      |
| Graphene      | graphene       | Graphene is a lightweight library OS, designed to run a single application with minimal host requirements                                                                                 |
| Cairo         | cairo          | Cairo is an open source graphics library                                                                                                                                                  |
| HarfBuzz      | harfbuzz       | HarfBuzz is a software development library for text shaping                                                                                                                               |
| Pango         | pango          | Pango is a text layout engine library which works with the HarfBuzz shaping engine for displaying multi-language text                                                                     |
| GIO           | gio            | GIO is a library, designed to present programmers with a modern and usable interface to a virtual file system                                                                             |
| GdkPixbuf     | gdkpixbuf      | dkPixbuf is a library that loads image data in various formats and stores it as linear buffers in memory                                                                                  |
| Atk           | atk            | Accessibility Toolkit is an open source software library, part of the GNOME project, which provides application programming interfaces for implementing accessibility support in software |
| GDK           | gdk            | GDK is a library that acts as a wrapper around the low-level functions provided by the underlying windowing and graphics systems                                                          |
| librsvg       | rsvg           | librsvg is a free software SVG rendering library                                                                                                                                          |
| GSK           | gsk            | GTK Scene Graph Kit (GSK) is the rendering and scene graph API for GTK                                                                                                                    |
| GTK           | gtk            | GTK is a free and open-source cross-platform widget toolkit for creating graphical user interfaces                                                                                        |
| libadwaita    | adw            | Building blocks for modern GNOME applications.                                                                                                                                            |
| GtkSourceView | sourceview     | GtkSourceView is a GNOME library that extends GtkTextView, the standard GTK+ widget for multiline text editing                                                                            |
| libsoup2.4    | soup           | libsoup is an HTTP client/server library for GNOME                                                                                                                                        |
| libshumate    | shumate        | libshumate is a C library providing a GtkWidget to display maps                                                                                                                           |

### LICENSE

Gtkd and gtkD use LGPLv3 license
