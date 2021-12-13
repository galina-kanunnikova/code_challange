import Glibc
import Foundation


var moles = 0
for i in 0...15 {
    let line = readLine()!
    var begin = false //start of the garden
    var fences = 0 //fances = 2 means that one part of the garden ended,fances = 1 : a part of the garden just started

    if line.contains("o") && (line.contains("|") || line.contains("++") ){
       let characterArray = Array(line)
       for i in 1..<characterArray.count-1 {
         let current = characterArray[i]
         let next = characterArray[i+1]
         let last = characterArray[i-1]
         if !begin && (last == "|"  || last == "+") && (current == " " || current == "o")
         && (substring(line:line,indexStart:i,indexEnd:characterArray.count).contains("|")
         || substring(line:line,indexStart:i,indexEnd:characterArray.count).contains("+"))
         && fences < 2{
             begin = true
             fences = 1
          }

         if begin == true && current == "o"{
            moles += 1
          }

          if begin && ((next == "|") || next == "+")  {
             begin = false
             fences = 2
          }
          if (last == "|" || last == "+") && !begin{
            fences = 1
          }
    
        }
    }
}

func substring(line: String, indexStart: Int,indexEnd: Int) -> Substring{
    let start = line.index(line.startIndex, offsetBy: indexStart)
    let end = line.index(line.startIndex, offsetBy: indexEnd)
    return line[start..<end]
}
print(moles)
