project('gtk4d', 'd',
    meson_version : '>=0.63',

    license: 'LGPL-3.0',
    version: '4.8.1'
)

project_soversion = 0


cc = meson.get_compiler('d')

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
gio_dep           = dependency('gio-unix-2.0')
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
gen_dir = 'generated'
gtkd_source_dir = join_paths(source_root, 'src')
gen_build_dir = join_paths(build_root, gen_dir)
#gen_relative_build_dir = join_paths(,)
build_name = meson.project_build_root().split('/')

build_dir_name = build_name[-1]

if fs.exists(gen_build_dir) 

    globber = run_command(globex, '--path', gen_build_dir, check: false)
    if globber.returncode() != 0
        error('Could glob the d binding interface files')
    endif

    gir_binding_sources = globber.stdout().strip().split('\n')

else

    message('Generating D interfaces from GIR...')
    girtod_gen = run_command(gir_to_d_prog,
                            '-i', gtkd_source_dir,
                            '-o', gen_build_dir,
                            '--print-files', 'relative,' + source_root,
                            check: false)
    if girtod_gen.returncode() != 0
        error('Unable to build D intefaces from GIR:\n' + girtod_gen.stderr())
    endif
    
    gir_binding_sources = girtod_gen.stdout().strip().split('\n')

    
endif

gir_bind_dir = include_directories(gen_dir)
gtk_root_include = include_directories(join_paths(build_dir_name, 'generated'))
adw_include = include_directories(join_paths(build_dir_name, 'generated','adw'))
atk_include = include_directories(join_paths(build_dir_name, 'generated', 'atk'))
cairo_include = include_directories(join_paths(build_dir_name, 'generated', 'cairo'))
gdk_include = include_directories(join_paths(build_dir_name, 'generated', 'gdk'))
gdkpixbuf_include = include_directories(join_paths(build_dir_name, 'generated', 'gdkpixbuf'))
gio_include = include_directories(join_paths(build_dir_name, 'generated', 'gio'))
glib_include = include_directories(join_paths(build_dir_name, 'generated','glib'))
gobject_include = include_directories(join_paths(build_dir_name, 'generated','gobject'))
graphene_include = include_directories(join_paths(build_dir_name, 'generated', 'graphene'))
gsk_include = include_directories(join_paths(build_dir_name, 'generated', 'gsk'))
gthread_include = include_directories(join_paths(build_dir_name, 'generated','gthread'))
gtk_include = include_directories(join_paths(build_dir_name, 'generated', 'gtk'))
harfbuzz_include = include_directories(join_paths(build_dir_name, 'generated','harfbuzz'))
gtkd_include = include_directories(join_paths(build_dir_name, 'generated', 'gtkd'))
pango_include = include_directories(join_paths(build_dir_name, 'generated','pango'))
rsvg_include = include_directories(join_paths(build_dir_name, 'generated', 'rsvg'))
shumate_include = include_directories(join_paths(build_dir_name, 'generated', 'shumate'))
soup_include = include_directories(join_paths(build_dir_name, 'generated', 'soup'))
sourceview_include = include_directories(join_paths(build_dir_name, 'generated', 'sourceview'))
# Enlist D GIR interface sources

gtk4d = library('Gtk4D',
    [gir_binding_sources],
    include_directories: [gir_bind_dir,
                          adw_include,
                          atk_include,
                          cairo_include,
                          gdk_include,
                          gdkpixbuf_include,
                          gio_include,
                          glib_include,
                          gobject_include,
                          graphene_include,
                          gsk_include,
                          gthread_include,
                          gtk_include,
                          gtkd_include,
                          pango_include,
                          rsvg_include,
                          shumate_include,
                          soup_include,
                          sourceview_include,
                          gtk_root_include],

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
                   cairo_dep
                   ],
    install: true,
    soversion: project_soversion,
    version: meson.project_version())

install_subdir(join_paths(build_root, gen_dir, 'gtkd/glib'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gio'),     install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gobject'), install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/adw'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/atk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/cairo'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/harfbuzz'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gdk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gdkpixbuf'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gsk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gthread'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gtk'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/graphene'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/gtkd'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'gtkd/pango'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'soup'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'shumate'),    install_dir: 'include/d/gtk4d/')
install_subdir(join_paths(build_root, gen_dir, 'sourceview'),    install_dir: 'include/d/gtk4d/')

pkg_conf.generate(gtk4d,
     name: 'gtk4d',
     subdirs: ['d/gtk4d'] ,
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
                cairo_dep
                ],
    description: 'D bindings for the GLib C Utility Library.')

# for use by others which embed this as subproject
gtk4d_dep = declare_dependency(
    link_with: [gtk4d],
    include_directories: [gir_bind_dir,
                          gir_bind_dir,
                          adw_include,
                          atk_include,
                          cairo_include,
                          gdk_include,
                          gdkpixbuf_include,
                          gio_include,
                          glib_include,
                          gobject_include,
                          graphene_include,
                          gsk_include,
                          gthread_include,
                          gtk_include,
                          gtkd_include,
                          pango_include,
                          rsvg_include,
                          shumate_include,
                          soup_include,
                          sourceview_include,
                          gtk_root_include]
)

subdir('tests')
