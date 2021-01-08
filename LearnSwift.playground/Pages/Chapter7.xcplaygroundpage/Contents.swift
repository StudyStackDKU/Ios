func multiplyByTen(value: Int?) {
    guard let number = value, number < 10 else {
        print("Number is too high")
        return
    }
}
var number = 10
let result = number * 10
print(result)
