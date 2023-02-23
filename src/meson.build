gir_to_d_prog = find_program('girtod')
generated_source = custom_target(
    'target',
    input: 'APILookup.txt',
    output: 'generate',
    install: true,
    install_dir: 'include/d/gtk4d',
    build_by_default: true,
    depends: ['build_trg'],
    capture: true,
    command : [gir_to_d_prog, '-i', '@INPUT@', '-o', '@OUTDIR@'],
)

build_trg = build_target(
    'build_trg',
    dependencies:,
    sources: generated_source,
)


