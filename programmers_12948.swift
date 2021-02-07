func solution(_ phone_number:String) -> String {
    return String(repeating: "*", count: phone_number.count - 4) + phone_number[phone_number.index(phone_number.endIndex, offsetBy: -4)..<phone_number.endIndex]
}