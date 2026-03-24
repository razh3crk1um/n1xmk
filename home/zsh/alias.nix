{...}: {
  programs.zsh.shellAliases = {
    fw = "export ALL_PROXY=socks5://127.0.0.1:10808";
    uw = "unset ALL_PROXY";

    # eza
    l = "eza -ah --group-directories-first --icons=auto";
    ll = "eza -alh --git --group-directories-first --icons=auto";
    la = "eza -lbhHigUmuSa --time-style=long-iso --git --icons=auto";
    #las = "eza -lbF --git --total-size --group-directories-first icons=auto";

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

    cip = "curl cip.cc";
    wea = "curl wttr.in/shenzhen";
    nocap = "amixer set Capture nocap";

    # git
    g = "git";
    gst = "git status";
    ga = "git add";
    gac = "git add . && git commit -m";
    gc = "git commit -m";
    gca = "git commit --amend --no-edit";

    gsw = "git switch";
    gsc = "git switch -c";
    grs = "git restore --staged";
    grw = "git restore";

    gbr = "git branch";
    gm = "git merge";
    gp = "git push";
    gpl = "git pull";
    gph = "git push --set-upstream origin $(git symbolic-ref --short HEAD)";

    gd = "git diff";
    gdc = "git diff --cached";
    glo = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all";
    gls = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat";

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
