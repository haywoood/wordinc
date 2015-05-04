letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
timeout = null

getNextChar = (char) ->
  idx = letters.indexOf char
  nextChar = letters[idx + 1]
  nextChar or false

incrementN = (idx, arr) ->
  curChar  = arr[idx]
  if curChar is "z"
    arr[idx] = "a"
    incrementN(--idx, arr)
  else
    arr[idx] = getNextChar curChar
    arr

increment = (arr) ->
  idx = arr.length - 1
  incrementN idx, arr

incrementStr = (str) -> increment(str.split "").join ""

cycleIncrement = (str) ->
  incd = incrementStr str
  console.log incd
  timeout = setTimeout cycleIncrement.bind(null, incd), 1

cycleIncrement "aaaaaaaaaaa"

clearTimeout timeout
