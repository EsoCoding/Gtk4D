project('window', 'd',
    meson_version : '>=0.63',

    license: 'LGPL-3.0',
    version: '0.1.0'
)

gtk4d_dep = dependency('gtk4d')

mesontest = executable(
	'window', 'source/app.d',
	dependencies: [gtk4d_dep],
)

