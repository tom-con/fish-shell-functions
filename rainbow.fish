function rainbow -a STR
  set ACC
  set COLORS "#D7FFEC" "#C4FFE3" "#A1FFD3" "#B2FFDC" "#8FFFCA" "#7FFFC2" "#6EFFB9" "#60FFB2" "#52FFAA"
  set LENGTH (count $COLORS)
  set POS (math 1 + 0)
  set REVERSE 0
  for LETTER in (echo "$STR" | string split "")
    set ACC "$ACC"(set_color $COLORS[$POS])"$LETTER"
    if [ "$POS" = "$LENGTH" ]
      set REVERSE 1
    end
    if [ "$POS" = 1 ]
      set REVERSE 0
    end
    if [ "$REVERSE" = 1 ]
      set POS (math "$POS-1")
    else
      set POS (math "$POS+1")
    end
  end
  echo "$ACC"
end