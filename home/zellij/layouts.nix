{...}: {
  programs.zellij.layouts = {
    "00-core" = {
      layout = {
        _children = [
          {
            default_tab_template = {
              _children = [
                #{
                #  pane = {
                #    size = 1;
                #    borderless = true;
                #    plugin = {location = "zellij:tab-bar";};
                #  };
                #}
                {"children" = {};}
                {
                  pane = {
                    size = 1;
                    borderless = true;
                    plugin = {location = "zellij:compact-bar";};
                  };
                }
                #{
                #  pane = {
                #    size = 2;
                #    borderless = true;
                #    plugin = {location = "zellij:status-bar";};
                #  };
                #}
              ];
            };
          }
          # Tab 1: sys
          {
            tab = {
              _props = {
                name = "sys";
                focus = true;
              };
              _children = [
                {
                  pane = {
                    _props = {split_direction = "vertical";};
                    _children = [
                      # left side: 30% 45% 25%
                      {
                        pane = {
                          _props = {
                            split_direction = "horizontal";
                            size = "50%";
                          };
                          _children = [
                            {
                              pane = {
                                _props = {
                                  split_direction = "vertical";
                                  size = "30%";
                                };
                                _children = [
                                  {pane = {};}
                                  {pane = {command = "bluetoothctl";};}
                                ];
                              };
                            }
                            #{ pane = { size = "30%"; }; }
                            {
                              pane = {
                                size = "45%";
                                command = "ncmpcpp";
                              };
                            }
                            #{ pane = { size = "45%"; }; }
                            {pane = {size = "25%";};}
                          ];
                        };
                      }
                      # right side
                      {
                        pane = {
                          size = "50%";
                          focus = true;
                        };
                      }
                    ];
                  };
                }
              ];
            };
          }
          # Tab 2: monitor
          {
            tab = {
              _props = {name = "monitor";};
              _children = [{pane = {command = "btop";};}];
            };
          }
          # Tab 3: ssh
          {
            tab = {
              _props = {
                name = "ssh";
                split_direction = "horizontal";
              };
              #_children = [ { pane = { }; } ];
              _children = [
                {pane = {size = "50%";};}
                {pane = {size = "50%";};}
              ];
            };
          }
        ];
      };
    };
    "default" = {
      layout = {
        _children = [
          {
            default_tab_template = {
              _children = [
                {"children" = {};}
                {
                  pane = {
                    size = 1;
                    borderless = true;
                    plugin = {location = "zellij:compact-bar";};
                  };
                }
              ];
            };
          }

          {
            tab = {
              _props = {
                name = "main";
                focus = true;
              };
              _children = [{pane = {};}];
            };
          }
        ];
      };
    };
  };
}
