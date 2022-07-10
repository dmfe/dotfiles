# Base16 Styling Guidelines:

base00='#21272d' # - Default
base01='#151515' # - Lighter Background (Used for status bars)
base02='#202020' # - Selection Background
base03='#909090' # - Comments, Invisibles, Line Highlighting
base04='#505050' # - Dark Foreground (Used for status bars)
base05='#d0d0d0' # - Default Foreground, Caret, Delimiters, Operators
base06='#e2e1d9' # - Light Foreground (Not often used)
base07='#f5f5f5' # - Light Background (Not often used)
base08='#ac4142' # - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
base09='#d28445' # - Integers, Boolean, Constants, XML Attributes, Markup Link Url
base0A='#f4bf75' # - Classes, Markup Bold, Search Text Background
base0B='#90a959' # - Strings, Inherited Class, Markup Code, Diff Inserted
base0C='#2b66c5' # - Support, Regular Expressions, Escape Characters, Markup Quotes
base0D='#6a9fb5' # - Functions, Methods, Attribute IDs, Headings
base0E='#3781fa' # - Keywords, Storage, Selector, Markup Italic, Diff Changed
base0F='#8f5536' # - Deprecated, Opening/Closing Embedded Language Tags, e.g. <? php ?>

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set-option -g status-style fg=$base03,bg=$base00

set-window-option -g window-status-style fg=$base03,bg=$base00
set-window-option -g window-status-format " [#I] #W "

# active window title colors
set-window-option -g window-status-current-style fg=$base06,bg=$base0C
set-window-option -g window-status-current-format " #[bold][#I] #W "

# pane border colors
set-window-option -g pane-active-border-style fg=$base00
set-window-option -g pane-border-style fg=$base00

# copy mode highlighting
set-window-option -g mode-style fg=$base06,bg=$base0C

# message text
set-option -g message-style bg=$base00,fg=$base06

# pane number display
set-option -g display-panes-active-colour $base0C
set-option -g display-panes-colour $base03

# clock
set-window-option -g clock-mode-colour $base0C

set-option -g status-right ''

tm_session_name="#[default,bg=$base00,fg=$base06] #S "
set -g status-left "$tm_session_name"

