if status is-interactive
    # Commands to run in interactive sessions can go here
  set -x LANG en_US.UTF-8
  set -g fish_key_bindings fish_vi_key_bindings
  set -g fish_vi_force_cursor 1
  set -g fish_vi_mode insert
  set -g fish_cursor_insert line
end

