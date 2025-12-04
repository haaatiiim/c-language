run() {
  if [ $# -eq 0 ]; then
    echo "❌ Please provide a .c file. Example: run hello.c"
    return 1
  fi

  file="$1"
  if [ ! -f "$file" ]; then
    echo "❌ File '$file' not found."
    return 1
  fi

  tmp_exe="temp_$$.exe"  # Unique temp executable using shell PID
  gcc "$file" -o "$tmp_exe"

  if [ $? -eq 0 ]; then
    ./"$tmp_exe"
    rm "$tmp_exe"
  else
    echo "❌ Compilation failed."
  fi
}
