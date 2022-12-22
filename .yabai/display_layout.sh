desktop=$1
layout=$2

yabai -m query --spaces --display 2 | jq -c '.[].index' | xargs -L1 -I'{}' yabai -m space {} --layout $layout
