local opt = vim.opt

-- Set all options directly on vim.opt
opt.hls = false
opt.is = true
opt.ts = 4
opt.sw = 4
opt.sts = 4
opt.et = true
opt.ai = true
opt.fenc = 'utf-8'
opt.enc = 'utf-8'
opt.nu = true
opt.ic = true
opt.wrap = false
opt.cb = 'unnamedplus'
opt.lcs = 'tab:> ,eol:↴,extends:>,precedes:<'
opt.list = true
opt.cul = true
opt.cc = '80'
opt.so = 10
opt.eb = false
opt.swf = false
opt.bk = false
opt.udir = os.getenv('HOME') .. '/undodir'
opt.udf = true
opt.scl = 'yes'
opt.cot = { 'menuone', 'noselect' }
opt.mouse = 'a'
opt.ph = 10
opt.stal = 2
opt.scs = true
opt.si = true
opt.sb = true
opt.spr = true
opt.tgc = true
opt.ut = 300
opt.tm = 300
opt.to = true
opt.title = true
opt.wb = false
opt.wim = 'longest,list,full'
opt.cmdheight = 1

-- Options that need appending
opt.isk:append('-')
opt.shm:append('c')
