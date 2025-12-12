# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
#window_root "~/Projects/editor"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "git"

# Split window into panes.
# split_h 1
# split_v 10

# Run commands.
run_cmd "lazygit"  # runs in active pane

# Paste text
#send_keys "top"    # paste into active pane
#send_keys "date" 1 # paste into pane 1

# Set active pane.
# select_pane 1
