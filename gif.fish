function gif -a filename
  set is_mov (ls "$filename" | grep ".mov" )
  if not test -n $filename; or test -z "$is_mov"
    echo "Need a .mov filename as first arg, removing the .mov"
    return
  end

  set resolution (ffprobe -v quiet -print_format json -show_format -show_streams $filename | jq ."streams" | jq ' .[] | .width, .height' | string join "x")
  echo "Resolution detected, will be set to: $resolution"
  set retrieved_fps (ffprobe -v error -select_streams v -of default=noprint_wrappers=1:nokey=1 -show_entries stream=r_frame_rate $filename)
  set fps (math (math "$retrieved_fps") / 2)
  echo "FPS detected, will be set to: $fps"

  set no_ext (basename $filename .mov)

  ffmpeg -i $filename -s $resolution -pix_fmt rgb8 -r $fps -f gif - | gifsicle --optimize=3 --delay=3 > "$no_ext.gif"

end

