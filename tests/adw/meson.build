# source files to add to builddir
adw_sources = [
  'app.d'
]

adw = executable(
	'adwtest', adw_sources,
	include_directories: [gir_bind_dir],
	dependencies: [gtk_dep, glib_dep, gobject_dep, gio_dep, gthread_dep],
	link_with: [gtk4d]
)

test('gobject_value_test', adw)