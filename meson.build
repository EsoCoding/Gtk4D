project('Gtk4D', 'd',
    meson_version : '>=0.60',

    license: 'LGPL-3.0',
    version: '0.1.1'
)

project_soversion = 0

pkg_conf = import('pkgconfig')
fs = import('fs')

source_root = meson.project_source_root()
build_root = meson.project_build_root()
gen_dir = 'generated'

#
# Glib default Dependencies
#
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
soup_dep          = dependency('libsoup-3.0')
pango_dep         = dependency('pango')
shumate_dep       = dependency('shumate-1.0')
sourceview_dep    = dependency('gtksourceview-5')
adwaita_dep       = dependency('libadwaita-1')  
cairo_dep         = dependency('cairo')

# The Glib gir files are part of the gobject introspection package.
introspection_dep = dependency('gobject-introspection-1.0')

#
# Build interfaces from GIR
#

# Girtod
gir_to_d_prog = find_program('girtod')
# Glob, custom python script that globes generated files directory
# when generated files already exists. This way meson does not have to recompile
# all source files. Which it does when files are regenerated all the time.
globex = find_program(meson.current_source_dir() +'/build-aux/glob/glob.py')
# source api files 
gir_wrap_dir = join_paths(source_root, 'src')
gir_d_intf_build_dir = join_paths(build_root, gen_dir)


if fs.exists(gir_d_intf_build_dir) 

    globber = run_command(globex, '--path', gir_d_intf_build_dir, check: false)
    if globber.returncode() != 0
        error('Could glob the d binding interface files')
    endif

    gir_binding_sources = globber.stdout().strip().split('\n')

else

    message('Generating D interfaces from GIR...')
    girtod_gen = run_command(gir_to_d_prog,
                            '-i', gir_wrap_dir,
                            '-o', gir_d_intf_build_dir,
                            '--print-files', 'relative,' + source_root,
                            check: false)
    if girtod_gen.returncode() != 0
        error('Unable to build D intefaces from GIR:\n' + girtod_gen.stderr())
    endif
    
    gir_binding_sources = girtod_gen.stdout().strip().split('\n')

endif

gir_bind_dir = include_directories(gen_dir)
# Enlist D GIR interface sources

gtk4d = library('Gtk4D',
    [gir_binding_sources],
    include_directories: [gir_bind_dir],
    dependencies: [glib_dep, 
                   gmodule_dep, 
                   gobject_dep, 
                   gio_dep, 
                   gtk_dep, 
                   gdkpixbuf_dep, 
                   graphene_dep,
                   atk_dep,
                   gthread_dep,
                   harfbuzz_dep,
                   rsvg_dep,
                   soup_dep,
                   pango_dep,
                   shumate_dep,
                   sourceview_dep,
                   adwaita_dep,
                   cairo_dep],
    install: true,
    soversion: project_soversion,
    version: meson.project_version())

install_subdir(join_paths(build_root, gen_dir, 'glib'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gio'),     install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gobject'), install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gio'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'adw'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'atk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'cairo'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gdk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gdkpixbuf'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gsk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gthread'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'graphene'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'linker'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'pango'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'soup'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'shumate'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'sourceview'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'linker'),    install_dir: 'include/d/gtk4d/')

pkg_conf.generate(gtk4d,
    name: 'Gtk4D',
    subdirs: 'd/Gtk4D',
    version: meson.project_version(),
    requires: [glib_dep, 
               gmodule_dep, 
               gobject_dep, 
               gio_dep, 
               gtk_dep, 
               gdkpixbuf_dep, 
               graphene_dep,
               atk_dep,
               gthread_dep,
               harfbuzz_dep,
               rsvg_dep,
               soup_dep,
               pango_dep,
               shumate_dep,
               sourceview_dep,
               adwaita_dep,
               cairo_dep],
    description: 'D bindings for the GLib C Utility Library.')

# for use by others which embed this as subproject
glibd_dep = declare_dependency(
    link_with: [gtk4d],
    include_directories: [gir_bind_dir]
)

subdir('tests')
