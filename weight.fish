function weight -a file
  echo $file
  if [ -n "$file" ]
    du -sh node_modules/$file
  else
    du -h node_modules | sort -rh
  end
end