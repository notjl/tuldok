local opt = vim.opt

local opts = {
    hls = false,
    is = true,
    ts = 4,
    sw = 4,
    sts = 4,
    et = true,
    ai = true,
    fenc = "utf-8",
    enc = "utf-8",
    nu = true,
    rnu = true,
    ic = true,
    wrap = false,
    cb = "unnamedplus",
    list = true,
    cul = true,
    cc = "80",
    so = 10,
    eb = false,
    swf = false,
    bk = false,
    udir = os.getenv("HOME") .. "/undodir",
    udf = true,
    scl = "yes",
    cot = {"menuone", "noselect"},
    mouse = "a",
    ph = 10,
    stal = 2,
    scs = true,
    si = true,
    sb = true,
    spr = true,
    tgc = true,
    ut = 300,
    tm = 1000,
    title = true,
    wb = false,
    wim = "longest,list,full",
    cocu = "nc",
    cmdheight = 2,
    timeoutlen = 100,
}

opt.shm:append('c')

local to_append = {
    isk = "-",
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
