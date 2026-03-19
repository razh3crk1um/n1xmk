{...}: {
  programs.zsh.shellAliases = {
    fw = "export ALL_PROXY=socks5://127.0.0.1:10808";
    uv = "unset ALL_PROXY";

    # eza
    l = "eza -ah --group-directories-first --icons=auto";
    ll = "eza -alh --git --group-directories-first --icons=auto";
    la = "eza -lbhHigUmuSa --time-style=long-iso --git --icons=auto";
    #las = "eza -lbF --git --total-size --group-directories-first icons=auto";

    # trash-cli
    tp = "trash-put";
    tl = "trash-list";

    "?" = "tldr";
    se = "sudoedit";

    cp = "cp -i";
    afind = "ack -il";
    diff = "diff --color=auto";
    grep = "grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
    egrep = "egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";
    fgrep = "fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}";

    nv = "nvim";
    vim = "nvim";
    VIM = "vim";
    emacs = "vim";
    #pc = "proxychains4";
    #alias -s bz2="tar -xjvf"

    #alias -s c="vim"
    #alias -s cc="vim"
    #alias -s cpp="vim"
    #alias -s gz="tar -xzvf"
    #alias -s tgz="tar -xzvf"

    cip = "curl cip.cc";
    wea = "curl wttr.in/shenzhen";
    nocap = "amixer set Capture nocap";

    # git
    ga = "git add";
    gac = "git add . && git commit -m";
    gbr = "git branch";
    gco = "git checkout";
    gcb = "git checkout -b";
    gc = "git commit -m";
    gd = "git diff";
    gp = "git push";
    gpm = "git push -u origin master";
    gl = "git pull";
    glm = "git pull origin master";
    gm = "git merge";
    gst = "git status";
    glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all";
    glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat";
    lg = "lazygit";

    # cpp
    ctg = "ctags -R --c++-kinds=+px --fields=+niazs --extras=+q -f .tags";
    clg = "clang++ -O2 -std=c++14 -Weverything -Wno-c++98-compat";
    clgm = "fn() { clang++ -O2 -std=c++14 -Weverything -Wno-c++98-compat $2 $3 $4 -o $1 -lmuduo_net -lmuduo_base -lpthread;};fn";
    cmk = "mkdir build && cd build && cmake .. && make VERBOSE=1";
    cpm = "cppman";

    # golang
    gb = "go build";
    gr = "go run";

    niri-clean = "unset LESS_TERMCAP_se LESS_TERMCAP_so LESS_TERMCAP_mb LESS_TERMCAP_me LESS_TERMCAP_md LESS_TERMCAP_ue LESS_TERMCAP_us && niri-session";
  };
}
