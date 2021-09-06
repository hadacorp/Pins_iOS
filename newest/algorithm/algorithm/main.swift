//
//  main.swift
//  algorithm
//
//  Created by judongseok on 2021/09/05.
//

import Foundation

var N = 0
var r = 0
var c = 0
var ans = 0
var string = readLine()
if let string = string{
    let array = string.components(separatedBy: " ")
    N = Int(array[0])!
    r = Int(array[1])!
    c = Int(array[2])!
}

var size = NSDecimalNumber(decimal: pow(2, N)).intValue

func solve(y: Int, x: Int, size: Int) {
    // 찾고자 하는 좌표와 현재 위치가 같으면
    if y == r && x == c {
        print(ans)
        return
    }
    // (r, c)가 현재 사분면에 존재한다면
    if r < y + size && r >= y && c < x + size && c >= x{
        // 1사분면
        solve(y: y, x: x, size: size / 2)
        // 2사분면
        solve(y: y, x: x + size / 2, size: size / 2)
        // 3사분면
        solve(y: y + size / 2, x: x, size: size / 2)
        // 4사분면
        solve(y: y + size / 2, x: x + size / 2, size: size / 2)
    }
    else{
        ans += size * size
    }
}


solve(y: 0, x: 0, size: size)
