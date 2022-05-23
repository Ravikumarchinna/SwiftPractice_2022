import UIKit

var str = "Hello, playground"

//...Start Filter Array
var numbers = [1,2,3,4,3,3]

var filteredArray = [Int]()



for number in numbers {
    if number == 3 {
        filteredArray.append(number)
    }
}

filteredArray

let filtered = numbers.filter({return $0 < 3})
filtered

//...MAP
let maptransform = numbers.map({ return $0 * 3})
maptransform

//...End Filter Array
