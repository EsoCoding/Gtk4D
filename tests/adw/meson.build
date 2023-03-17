# source files to add to builddir
adw_sources = [
  'app.d'
]

adw = executable(
	'adwtest', adw_sources,
	include_directories:  [inc, libinc, localinc],
	dependencies: [gtk4d_dependencies],
	link_with: [gtk4d_lib]
)

test('gobject_value_test', adw)