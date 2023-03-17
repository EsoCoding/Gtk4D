globber = find_program('glob.py', required: true)

foreach lib : libsToGenerate
    message('******************************************')
    message('Generating bindings for '+ lib)
    message('******************************************')
    
    libFiles = run_command(globber, join_paths(meson.current_source_dir(), lib), check: true)
    
    if libFiles.returncode() != 0
        error('Could not read files in '+lib+' directory.')
    endif

    files_stdout = libFiles.stdout().strip().split('\n')
    #message('***************************************************************************')
    #message(files_stdout)
    #message('***************************************************************************')
     
    filesList = files(files_stdout)
    filesCList = files()

    if lib != 'gtkd'
        filesCList += files(join_paths(lib, 'c', 'functions.d'))
        filesCList += files(join_paths(lib, 'c', 'types.d'))
        set_variable(lib+'c', filesCList)
    endif

    set_variable(lib, filesList)

endforeach  

install_headers(gtkd, install_dir : get_option('includedir') / 'd/gtk4d/gtkd')

install_headers(adw, install_dir : get_option('includedir') / 'd/gtk4d/adw')
install_headers(adwc, install_dir : get_option('includedir') / 'd/gtk4d/adw/c')

install_headers(atk, install_dir : get_option('includedir') / 'd/gtk4d/atk')
install_headers(atkc, install_dir : get_option('includedir') / 'd/gtk4d/atk/c')

install_headers(cairo, install_dir : get_option('includedir') / 'd/gtk4d/cairo')
install_headers(cairoc, install_dir : get_option('includedir') / 'd/gtk4d/cairo/c')

install_headers(gdk, install_dir : get_option('includedir') / 'd/gtk4d/gdk')
install_headers(gdkc, install_dir : get_option('includedir') / 'd/gtk4d/gdk/c')

install_headers(gdkpixbuf, install_dir : get_option('includedir') / 'd/gtk4d/gdkpixbuf')
install_headers(gdkpixbufc, install_dir : get_option('includedir') / 'd/gtk4d/gdkpixbuf/c')

install_headers(gio, install_dir : get_option('includedir') / 'd/gtk4d/gio')
install_headers(gioc, install_dir : get_option('includedir') / 'd/gtk4d/gio/c')

install_headers(glib, install_dir : get_option('includedir') / 'd/gtk4d/glib')
install_headers(glibc, install_dir : get_option('includedir') / 'd/gtk4d/glib/c')

install_headers(gobject, install_dir : get_option('includedir') / 'd/gtk4d/gobject')
install_headers(gobjectc, install_dir : get_option('includedir') / 'd/gtk4d/gobject/c')

install_headers(graphene, install_dir : get_option('includedir') / 'd/gtk4d/graphene')
install_headers(graphenec, install_dir : get_option('includedir') / 'd/gtk4d/graphene/c')

install_headers(gsk, install_dir : get_option('includedir') / 'd/gtk4d/gsk')
install_headers(gskc, install_dir : get_option('includedir') / 'd/gtk4d/gsk/c')

install_headers(gthread, install_dir : get_option('includedir') / 'd/gtk4d/gthread')
install_headers(gthreadc, install_dir : get_option('includedir') / 'd/gtk4d/gthread/c')

install_headers(gtk, install_dir : get_option('includedir') / 'd/gtk4d/gtk')
install_headers(gtkc, install_dir : get_option('includedir') / 'd/gtk4d/gtk/c')

install_headers(harfbuzz, install_dir : get_option('includedir') / 'd/gtk4d/harfbuzz')
install_headers(harfbuzzc, install_dir : get_option('includedir') / 'd/gtk4d/harfbuzz/c')

install_headers(pango, install_dir : get_option('includedir') / 'd/gtk4d/pango')
install_headers(pangoc, install_dir : get_option('includedir') / 'd/gtk4d/pango/c')

install_headers(rsvg, install_dir : get_option('includedir') / 'd/gtk4d/rsvg')
install_headers(rsvgc, install_dir : get_option('includedir') / 'd/gtk4d/rsvg/c')

install_headers(shumate, install_dir : get_option('includedir') / 'd/gtk4d/shumate')
install_headers(shumatec, install_dir : get_option('includedir') / 'd/gtk4d/shumate/c')

install_headers(soup, install_dir : get_option('includedir') / 'd/gtk4d/soup')
install_headers(soupc, install_dir : get_option('includedir') / 'd/gtk4d/soup/c')

install_headers(sourceview, install_dir : get_option('includedir') / 'd/gtk4d/sourceview')
install_headers(sourceviewc, install_dir : get_option('includedir') / 'd/gtk4d/sourceview/c')

inc = include_directories('.')

