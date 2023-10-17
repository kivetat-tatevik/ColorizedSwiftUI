//
//  SliderWithTextFieldView.swift
//  ColorizedSwiftUI
//
//  Created by Tatevik Khunoyan on 17.10.2023.
//

import SwiftUI

struct SliderWithTextFieldView: View {
    
    @Binding var colorValue: Double
    @State private var showAlert = false
    @FocusState var isInputActive: Bool
    let sliderAccentColor: Color
    
    var body: some View {
        ZStack {
            HStack {
                Text("\(lround(colorValue))")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .frame(width: 35)
                    .foregroundColor(.white)
                
                Slider(value: $colorValue, in: 0...255, step: 1)
                    .accentColor(sliderAccentColor)
                
                TextField(
                    "\(lround(colorValue))",
                    value: $colorValue,
                    formatter: NumberFormatter.numbers,
                    onCommit: {
                        checkValue()
                    }
                )
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Done") {
                            isInputActive = false
                            checkValue()
                        }
                    }
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50)
                .keyboardType(.asciiCapableNumberPad)
                .focused($isInputActive)
                
                .alert(isPresented: $showAlert,
                       content: {
                    Alert(title: Text("🔥 Ошибка 🔥"),
                          message: Text("Введите значение от 0 до 255")
                    )
                })
            }
        }
        .frame(height: 40)
    }
    
    private func checkValue() {
        if colorValue < 0 || colorValue > 255 {
            showAlert = true
        }
    }
}

struct SliderAndTexts_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemFill).ignoresSafeArea()
            SliderWithTextFieldView(colorValue: .constant(100), sliderAccentColor: Color(.red))
        }
    }
}

extension NumberFormatter {
    static var numbers: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        return formatter
    }
}
