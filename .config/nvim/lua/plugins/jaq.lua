return { 'is0n/jaq-nvim', opts =
    { cmds = {
	    external = {
		    python = "python %",
		    cpp = "c++ % -O3 --std=c++20 -o $fileBase  && ./$fileBase",
		    c = "gcc % -o $fileBase -lm && ./$fileBase",
		    javascript = "node %",
		    scheme = "racket %",
		    racket = "racket %",
		    lisp = "sbcl --load %",
		    haskell = "ghc % && ./$fileBase",
		    html = "firefox %",
		    java = "java %",
		    lua = "lua %",
		    go = "go run %",
            rust = "cargo run"
	    }
    },
    behavior = {
        default = "terminal"
    },
    ui = {
	    startinsert = true,
    } }}
