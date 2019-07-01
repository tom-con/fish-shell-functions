function rainbow_red -a STR
  set ACC
  set COLORS "#FDF1CD" "#FDEAB6" "#FAE4A0" "#FADD8A" "#F9D775" "#F9D062" "#F8C33D" "#F8C94E" "#F7BC2C"
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