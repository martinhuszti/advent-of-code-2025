import Algorithms

struct Day01: AdventDay {
  enum Direction: Character {
    case Left = "L"
    case Right = "R"
  }
  
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String
  
  let startingPosition: Int = 50
  let maxNumberOfDials: Int = 99 + 1
  
  // Splits input data into its component parts and convert from string.
  var entities: [Int] {
    data.split(separator: "\n").map { str in
      let character = str.first!
      let direction = Direction(rawValue: character)!
      
      let stringStep = str.dropFirst()
      let intStep = Int(stringStep)!
      
      switch direction {
        case .Left:
          return -intStep
        
        case .Right:
          return intStep
      }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    var numberOfZeros = 0
    var pos = startingPosition
    
    for step in entities {
      pos += step
      if pos < 0 {
        pos = maxNumberOfDials + pos
      }
      pos = pos % maxNumberOfDials
      if pos == 0 {
        numberOfZeros += 1
      }
    }
    return numberOfZeros
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    var numberOfZeros = 0
    var pos = startingPosition
    
    for step in entities {
      print("Pos: \(pos), Step: \(step), New pos: \(pos + step)", terminator: " ")

      let prevPos = pos
      let ogStar = numberOfZeros
      pos += step
      
      let timesItCrossedZero = abs(pos) / maxNumberOfDials
      
      
      if pos < 0 {
        pos = pos % maxNumberOfDials
        pos = maxNumberOfDials + pos
        if prevPos != 0 {
          numberOfZeros += 1
        }
      }
      pos = pos % maxNumberOfDials

      if pos == 0 {
        numberOfZeros += 1
        numberOfZeros += max(0, timesItCrossedZero - 1)
      } else {
        numberOfZeros += timesItCrossedZero
      }
      let newZeros = numberOfZeros - ogStar
      if newZeros > 0 {
        print("⭐ \(numberOfZeros - ogStar)", terminator: "")
      }
      print("")
    }
    return numberOfZeros
  }
}
