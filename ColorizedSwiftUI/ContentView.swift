//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Tatevik Khunoyan on 17.10.2023.
//

import SwiftUI
struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(.systemTeal)
                .ignoresSafeArea()
            
            VStack {
                ColorBoardView(red: red, green: green, blue: blue)
                SliderWithTextFieldView(colorValue: $red, sliderAccentColor: .red)
                SliderWithTextFieldView(colorValue: $green, sliderAccentColor: .green)
                SliderWithTextFieldView(colorValue: $blue, sliderAccentColor: .blue)
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorBoardView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .frame(maxWidth: .infinity,maxHeight: 200)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .overlay(RoundedRectangle(cornerRadius: 25.0).stroke(Color.white, lineWidth: 3))
            .padding(.bottom, 20)
    }
}
