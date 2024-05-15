//
//  ContentView.swift
//  UnitConverter
//
//  Created by Om Preetham Bandi on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue: Double = 0.0
    @State private var selectedTemperature: String = "Celsius"
    @State private var conversionTemperature: String = "Fahrenheit"
    
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertTemperature: Double {
        switch (selectedTemperature, conversionTemperature) {
        case ("Celsius", "Fahrenheit"):
            return (initialValue * 9 / 5) + 32
        case ("Celsius", "Kelvin"):
            return initialValue + 273.15
        case ("Fahrenheit", "Celsius"):
            return (initialValue - 32) * 5 / 9
        case ("Fahrenheit", "Kelvin"):
            return ((initialValue - 32) * 5 / 9) + 273.15
        case ("Kelvin", "Celsius"):
            return initialValue - 273.15
        case ("Kelvin", "Fahrenheit"):
            return ((initialValue - 273.15) * 9 / 5) + 32
        default:
            return initialValue
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select Current Temperature")) {
                    Picker("Select Temperature", selection: $selectedTemperature) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Enter \(selectedTemperature) Temperature")) {
                    TextField("Enter \(selectedTemperature) Temperature", value: $initialValue, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Select Conversion Temperature")) {
                    Picker("Select Temperature", selection: $conversionTemperature) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Converted \(conversionTemperature) Temperature")) {
                    Text("\(convertTemperature, specifier: "%.2f")")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
