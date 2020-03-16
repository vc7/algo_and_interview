func minimumSteps(loggedMoves: [String]) -> Int {
  var result = 0
  for move in loggedMoves {
    switch move {
      case "../": result -= 1
      case "./": break
      default: result += 1
    }
  }
  return result
}
