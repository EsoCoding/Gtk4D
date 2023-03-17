project('shumate', 'd',
    meson_version : '>=0.63',

    license: 'LGPL-3.0',
    version: '0.1.0'
)

# source files to add to builddir
mesonshumate_sources = [
  'source/app.d'
]

gtk4d_dep = dependency('gtk4d')
shumate_dep = dependency('shumate-1.0')
libsoup_dep = dependency('libsoup-3.0', version: '3.2.0')

mesontest = executable(
	'shumate', mesonshumate_sources,
	dependencies: [gtk4d_dep, shumate_dep, libsoup_dep],
)

