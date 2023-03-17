if get_option('generate')
    girtod = find_program('girtod', required : true)

    # run command launches girtod -i is api dir and -o generated
    girtodGenerator = run_command(girtod, '-i', apiDir, '-o', genDir, '--print-free', check: true)

    # if generation was unsuccesfull trough error and exit.
    if girtodGenerator.returncode() != 0
        error('Unable to build D intefaces from GIR:\n' + girtodGenerator.stderr())
    endif
    
    message(girtodGenerator.stdout())
endif

