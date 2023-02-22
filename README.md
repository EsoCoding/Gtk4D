# Gtk4D

[Gtk4D](http://www.github.com/gtk-d/gtk-dhttp://www.github.com/gtk-d/gtk4d) is a D language (Digitial Mars D) wrapper for Gtk4.0 and other GObject library's like Gio, Shumate, Libsoup etc. Its forked from KonstantIMP [Gtk_D](https://github.com/KonstantIMP/gtk_d) version  who continued working on the official [Gtk-d](https://gtkd.org/) branch which seemed no longer to be under active development. Because of the inactivity on the git of gtk-d, failing install and examples and commits that no longer seemed to be merged, i decidided to maintain an alternative branch and continue the work of [Gtk_D](https://github.com/KonstantIMP/gtk_d) from KonstantIMP. I hope to make Gtk4D more interesting for the Gtk community that might have some interest in the D language.

### This is work in progres

This project is not yet finished and only the meson.build will work on this moment. And its only been tested on the latest ubuntu version 22.10.
So if you test it, let me know if you run into problems and post your issues so i or others can look into it.

### Requirements

- Linux, not tested on windows/osx. Meson.build file might need some adjustments.
- the gir files or dev version of libraries below
- dmd, gdc or ldc compiler
- [gir-to-d](https://github.com/Gtk4D/gir-to-d) from konstantIMP

[gir-to-d](https://github.com/Gtk4D/gir-to-d) from konstantIMP is needed, the official version won't work. On the git of [gir-to-d](https://github.com/Gtk4D/gir-to-d) you find the instructions on how to install and generate these binding interface files.


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
| libsoup       | soup           | libsoup is an HTTP client/server library for GNOME                                                                                                                                        |
| libshumate    | shumate        | libshumate is a C library providing a GtkWidget to display maps                                                                                                                           |

### install

For installing gtk4d on ubuntu 22.10, you can install the dependant library's using apt-get:

```
sudo apt-get install libglibd-2.0-dev libgraphene-1.0-dev libcairo2-dev libharfbuzz-dev libpango1.0-dev libgdk-pixbuf-2.0-dev librsvg2-dev libgtk-4-dev libadwaita-1-dev libgtksourceview-5-dev libsoup-3.0-dev libshumate-dev
```

After this you install the shared library on linux systems using meson and simply run:

```
meson setup build
meson compile -C build <-- builds gtk4d
meson install -C build <-- installs
```

If you want to use dub for your development, simple use add it to your project:

```
dub add gtk4d
```

Its possible to use submodule installation for dub projects which allows you to choose what library you want to install. You install them like you do usually but with :module-name after gtk4d:

```
dub add gtk4d:shumate
dub add gtk4d:glib
```

### TODO

Things that are really need to be worked on are

1. Writing tests,
2. Building examples
3. Creating composite templates
### Contributing

Anyone is free to help and contribute whether this is through posting issues, adding examples, adding libraries or perhaps you have published some helpful tutorials, please feel free to commit and support the progress in any way you can. If you want to make contact, you can send me a email at info@gtk-d.com or find me in [gtk-d](https://matrix.to/#/#gtkd:matrix.org) channel of the matrix chat server.

### gir files

In case you need gir files and can't find working ones, this [repo](https://github.com/gtk4d/gir-files) will give you working gir files from which girtod can create the bindigns.

### LICENSE

Gtkd and gtkD use LGPLv3 license
