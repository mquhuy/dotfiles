# Dracula Colours
# background_color '#282a36'
# current_line_color '#44475a'
# foreground_color '#f8f8f2'
# comment_color '#6272a4'
# cyan '#8be9fd'
# green '#50fa7b'
# orange '#ffb86c'
# pink '#ff79c6'
# purple '#bd93f9'
# red '#ff5555'
# yellow '#f1fa8c'

set -g default-terminal "screen-256color"
# pane border
set -g pane-border-style fg='#6272a4'
set -g pane-active-border-style fg='#ff79c6'
# message text
set -g message-style bg='#44475a',fg='#8be9fd'

# Status line style
set -g status-style bg='#44475a',fg='#bd93f9'
set -g status-interval 1

# status left
# are we controlling tmux or the content of the panes?
set -g status-left '#[bg=#f8f8f2]#[fg=#282a36]#{?client_prefix,#[bg=#ff79c6],} ☺ '

# are we zoomed into a pane?
set -ga status-left '#[bg=#44475a]#[fg=#ff79c6] #{?window_zoomed_flag, ↕  ,   }'

# window status
set-window-option -g window-status-style fg='#bd93f9',bg=default
set-window-option -g window-status-current-style fg='#ff79c6',bg='#282a36'

#set -g window-status-current-format "#[fg=#44475a]#[bg=#bd93f9]#[fg=#f8f8f2]#[bg=#bd93f9] #I #W #[fg=#bd93f9]#[bg=#44475a]"
#set -g window-status-format "#[fg=#f8f8f2]#[bg=#44475a]#I #W #[fg=#44475a] "

# status right
#set -g status-right '#[fg=#8be9fd,bg=#44475a]#[fg=#44475a,bg=#8be9fd] #(tmux-mem-cpu-load -g 5 --interval 2) '
#set -g status-right '#[fg=#bd93f9,bg=#44475a]#[fg=#44475a,bg=#bd93f9] #(uptime | cut -f 4-5 -d " " | cut -f 1 -d ",") '
#set -ga status-right '#[fg=#bd93f9,bg=#ff79c6]#[fg=#f8f8f2,bg=#bd93f9] %a %H:%M:%S #[fg=#6272a4]%Y-%m-%d '

