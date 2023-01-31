local opt = vim.opt

local opts = {
    hls = false,                                            -- highlight matches with last search pattern
    is = true,                                              -- highlight match while typing search pattern
    ts = 4,                                                 -- number of spaces that <Tab> in file uses
    sw = 4,                                                 -- number of spaces to use for (auto)indent step
    sts = 4,                                                -- number of spaces that <Tab> uses while editing
    et = true,                                              -- use spaces when <Tab> is inserted
    ai = true,                                              -- take indent for new line from previous line
    fenc = "utf-8",                                         -- file encoding for multi-byte text
    enc = "utf-8",                                          -- encoding used internally
    nu = true,                                              -- print the line number in front of each line
    -- rnu = true,                                          -- show relative line number in front of each line
    ic = true,                                              -- ignore case in search patterns
    wrap = false,                                           -- lines wrap and continue on the next line
    cb = "unnamedplus",                                     -- use the clipboard as the unnamed register
    -- lcs = "eol:↴,tab:<->,extends:>,precedes:<,lead:·",   -- characters for displaying in list mode (eol: ↵)
    lcs = "eol:↴,tab:<->,extends:>,precedes:<",             -- characters for displaying in list mode (eol: ↵)
    list = true,                                            -- <Tab> and <EOL>
    -- gcr = "a:block",                                     -- GUI: settings for cursor shape and blinking
    cul = true,                                             -- hightlight the screen line of the cursor
    cc = "80",                                              -- columns to highlight
    so = 10,                                                -- minimum number of lines above and below cursor
    eb = false,                                             -- ring the bell for error messages
    swf = false,                                            -- whether to use a swapfile for a buffer
    bk = false,                                             -- keep backup file after overwriting a file
    udir = os.getenv("HOME") .. "/undodir",                 -- where to store undo files
    udf = true,                                             -- save undo information in a file
    scl = "yes",                                            -- when to display the sign column
    cot = {"menuone", "noselect"},                          -- options for [Insert] completion
    mouse = "a",                                            -- the use of mouse clicks
    ph = 10,                                                -- maximum height of popup menu
    stal = 2,                                               -- tells when the tab pages line is displayed
    scs = true,                                             -- no ignore case when pattern has uppercase
    si = true,                                              -- smart indenting
    sb = true,                                              -- new window from split is below the current one
    spr = true,                                             -- new window is put right of the current one
    tgc = true,                                             -- terminal true color support
    ut = 300,                                               -- after this many milliseconds flush swap file
    tm = 1000,                                              -- time out time in milliseconds
    title = true,                                           -- Vim set the title of the window
    wb = false,                                             -- make a backup before overwriting a file
    wim = "longest,list,full",                              -- mode for 'wildchar' command-line expansion
    -- cocu = "nc",                                         -- conceal cursor for normal and command
    cmdheight = 1,                                          -- Height for the command line
    timeoutlen = 300,                                       -- Timeout for mapped sequences
}

opt.shm:append('c')

local to_append = {
    isk = "-",                                              -- characters included in keywords
    shm = "c",
}

-- set options that needs append using an iterator
for key, value in pairs(to_append) do
    opt[key]:append(value)
end

-- set options using an iterator
for key, value in pairs(opts) do
    opt[key] = value
end
