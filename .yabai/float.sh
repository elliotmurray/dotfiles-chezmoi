window_json=`yabai -m query --windows --window`
is_floating=`echo $window_json | jq '."is-floating"'`
is_sticky=`echo $window_json | jq '."is-sticky"'`
is_topmost=`echo $window_json | jq '."is-topmost"'`

if [ "$is_floating" = false ]
then
  yabai -m window --toggle float
fi

if [ "$is_sticky" = false ]
then
  yabai -m window --toggle sticky
fi

if [ "$is_topmost" = false ]
then
  yabai -m window --toggle topmost
fi

yabai -m window --grid 8:4:1:1:2:6
