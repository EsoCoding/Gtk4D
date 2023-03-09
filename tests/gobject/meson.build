dclosure_test = executable(
	'dclosure_test',
	'DClosureTest.d',
	include_directories:  [inc, libinc, localinc],
	dependencies: [gtk4d_dependencies],
	link_with: [gtk4d_lib]
)
test('gobject_dclosure_test', dclosure_test)

objectg_test = executable(
	'objectg_test',
	'ObjectGTest.d',
	include_directories:  [inc, libinc, localinc],
	dependencies: [gtk4d_dependencies],
	link_with: [gtk4d_lib]
)
test('gobject_objectg_test', objectg_test, env: ['G_DEBUG=fatal-warnings'])

value_test = executable(
	'value_test',
	'ValueTest.d',
	include_directories: [inc, libinc, localinc],
	dependencies: [gtk4d_dependencies],
	link_with: [gtk4d_lib]
)
test('gobject_value_test', value_test)
