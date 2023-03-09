project('Gtk4D', 'd',
    meson_version : '>=0.63',
    license: 'LGPL-3.0',
    version: '0.1.0'
)

############################## Gtk/GObject Dependencies ######################################

glib_dep          = dependency('glib-2.0')
gmodule_dep       = dependency('gmodule-2.0')
gobject_dep       = dependency('gobject-2.0')
gio_dep           = dependency('gio-2.0')
gtk_dep           = dependency('gtk4')
gdkpixbuf_dep     = dependency('gdk-pixbuf-2.0')
graphene_dep      = dependency('graphene-1.0')
atk_dep           = dependency('atk')
gthread_dep       = dependency('gthread-2.0')
harfbuzz_dep      = dependency('harfbuzz')
rsvg_dep          = dependency('librsvg-2.0')
soup_dep          = dependency('libsoup-2.4')
pango_dep         = dependency('pango')
shumate_dep       = dependency('shumate-1.0')
sourceview_dep    = dependency('gtksourceview-5')
adw_dep           = dependency('libadwaita-1')  
cairo_dep         = dependency('cairo')
introspection_dep = dependency('gobject-introspection-1.0')

############################ General defines for path and directory name ###############################

# library soversion
project_soversion = 0

# main paths needed for build
prefix = get_option ('prefix')
sourceRoot = meson.project_source_root()
buildRoot = meson.project_build_root()
apiDir = join_paths(sourceRoot, 'api')
genDir = join_paths(sourceRoot, 'generated')
gtkdDir = join_paths(genDir,'gtkd')
cairoDir = join_paths(genDir,'cairo')

# array contains directory names and run trough the foreach loop
libsToGenerate = ['gtkd', 'cairo', 'adw', 'atk', 'gdk', 'gdkpixbuf', 'gio', 'glib', 'gobject', 'graphene', 
                  'gsk', 'gthread', 'gtk', 'harfbuzz', 'pango', 'rsvg', 'shumate', 'soup', 'sourceview']

# c dependency
gtk4d_dependencies = [glib_dep, gthread_dep, gobject_dep, gmodule_dep, gio_dep, cairo_dep, gdkpixbuf_dep, atk_dep, pango_dep, rsvg_dep, adw_dep, soup_dep, graphene_dep, adw_dep, gtk_dep, introspection_dep]

subdir('api')
subdir('generated')

localinc = include_directories('generated')
libinc = include_directories('lib')

# create lib
subdir('lib')

# generate pkg-config
subdir('pkg')

gtk4_dep = declare_dependency(
    link_with: [gtk4d_lib],
    include_directories: [inc, libinc, localinc],
    dependencies: [gtk4d_dependencies],
)

subdir('tests')