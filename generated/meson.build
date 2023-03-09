globber = find_program('glob.py')

foreach lib : libsToGenerate
    
    message('Generating bindings for '+ lib)
    
    libFiles = run_command(globber, join_paths(meson.current_source_dir(),lib), check: false)
    if libFiles.returncode() != 0
        error('Failed '+lib+' directory.')
    endif

    files_stdout = libFiles.stdout().strip().split('\n')

    message(files_stdout)

    filesList = files(files_stdout)
    
    set_variable(lib, filesList)

endforeach  

install_headers(gtkd, install_dir : get_option('includedir') / 'd/gtk4d/gtkd')

install_headers(adw, install_dir : get_option('includedir') / 'd/gtk4d/adw')

install_headers(atk, install_dir : get_option('includedir') / 'd/gtk4d/atk')

install_headers(cairo, install_dir : get_option('includedir') / 'd/gtk4d/cairo')

install_headers(gdk, install_dir : get_option('includedir') / 'd/gtk4d/gdk')

install_headers(gdkpixbuf, install_dir : get_option('includedir') / 'd/gtk4d/gdkpixbuf')

install_headers(gio, install_dir : get_option('includedir') / 'd/gtk4d/gio')

install_headers(glib, install_dir : get_option('includedir') / 'd/gtk4d/glib')

install_headers(gobject, install_dir : get_option('includedir') / 'd/gtk4d/gobject')

install_headers(graphene, install_dir : get_option('includedir') / 'd/gtk4d/graphene')

install_headers(gsk, install_dir : get_option('includedir') / 'd/gtk4d/gsk')

install_headers(gthread, install_dir : get_option('includedir') / 'd/gtk4d/gthread')

install_headers(gtk, install_dir : get_option('includedir') / 'd/gtk4d/gtk')

install_headers(harfbuzz, install_dir : get_option('includedir') / 'd/gtk4d/harfbuzz')

install_headers(pango, install_dir : get_option('includedir') / 'd/gtk4d/pango')

install_headers(rsvg, install_dir : get_option('includedir') / 'd/gtk4d/rsvg')

install_headers(shumate, install_dir : get_option('includedir') / 'd/gtk4d/shumate')

install_headers(soup, install_dir : get_option('includedir') / 'd/gtk4d/soup')

install_headers(sourceview, install_dir : get_option('includedir') / 'd/gtk4d/sourceview')

inc = include_directories('.')

