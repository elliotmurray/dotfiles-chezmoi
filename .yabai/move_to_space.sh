space=$1

if [ -z "$1" ]
then
  space=`yabai -m query --spaces --space | jq .index`
fi

window_json=`yabai -m query --windows --window`
is_floating=`echo $window_json | jq '."is-floating"'`
is_sticky=`echo $window_json | jq '."is-sticky"'`
is_topmost=`echo $window_json | jq '."is-topmost"'`

if [ "$is_floating" = true ]
then
  yabai -m window --toggle float
fi

if [ "$is_sticky" = true ]
then
  yabai -m window --toggle sticky
fi

if [ "$is_topmost" = true ]
then
  yabai -m window --toggle topmost
fi

yabai -m window --layer normal --space $space
yabai -m space --focus $space

