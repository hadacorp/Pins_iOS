//
//  SignUpViewModel.swift
//  Pins
//
//  Created by judongseok on 2022/05/23.
//

import Foundation

class SignUpViewModel {
    var isNext = false
    
    let hangul: Set<String> = {
        return ["ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ",
                "ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅗ", "ㅛ", "ㅜ", "ㅠ", "ㅡ", "ㅣ", "ㄲ", "ㄸ", "ㅉ", "ㅃ",
                "ㅆ", "ㅘ", "ㅝ", "ㅞ", "ㅟ", "ㅙ", "ㅢ"]
    }()
}
