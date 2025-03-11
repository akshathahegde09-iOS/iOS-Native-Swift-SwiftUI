//
//  ContentView.swift
//  Conversion
//
//  Created by Akshatha Hegde on 11/12/24.
//

import SwiftUI

//struct ContentView: View {
//    @State private var inputUnit: UnitLength = .meters
//    @State private var outputUnit: UnitLength = .feet
//    @State private var inputValue: String = ""
//
//    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
//
//    var convertedValue: Double? {
//        guard let input = Double(inputValue) else { return nil }
//        let inputMeasurement = Measurement(value: input, unit: inputUnit)
//        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
//        return outputMeasurement.value
//    }
//
//    var body: some View {
//        NavigationStack {
//            Form {
//                // Input Unit Selection
//                Section(header: Text("Input Unit")) {
//                    Picker("Input Unit", selection: $inputUnit) {
//                        ForEach(lengthUnits, id: \.symbol) { unit in
//                            Text(unit.symbol).tag(unit)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//
//                // Output Unit Selection
//                Section(header: Text("Output Unit")) {
//                    Picker("Output Unit", selection: $outputUnit) {
//                        ForEach(lengthUnits, id: \.symbol) { unit in
//                            Text(unit.symbol).tag(unit)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//
//                // Input Value
//                Section(header: Text("Input Value")) {
//                    TextField("Enter value", text: $inputValue)
//                        .keyboardType(.decimalPad)
//                }
//
//                // Converted Value
//                Section(header: Text("Converted Value")) {
//                    if let result = convertedValue {
//                        Text(result, format: .number)
//                    } else {
//                        Text("Enter a valid number")
//                            .foregroundColor(.red)
//                    }
//                }
//            }
//            .navigationTitle("Unit Converter")
//        }
//    }
    
import Foundation

struct ContentView: View {
    // Length Conversion
    @State private var inputUnit: UnitLength = .meters
    @State private var outputUnit: UnitLength = .feet
    @State private var inputValue: String = ""
    @State private var convertedValue: String = ""
    let lengthUnits: [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]

    // Temperature Conversion
    @State private var inputTempUnit: UnitTemperature = .celsius
    @State private var outputTempUnit: UnitTemperature = .fahrenheit
    @State private var inputTempValue: String = ""
    @State private var convertedTempValue: String = ""
    let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]

    // Time Conversion
    @State private var inputTimeUnit: UnitDuration = .seconds
    @State private var outputTimeUnit: UnitDuration = .minutes
    @State private var inputTimeValue: String = ""
    @State private var convertedTimeValue: String = ""
    let timeUnits: [UnitDuration] = [.seconds, .minutes, .hours]

    // Volume Conversion
    @State private var inputVolumeUnit: UnitVolume = .liters
    @State private var outputVolumeUnit: UnitVolume = .gallons
    @State private var inputVolumeValue: String = ""
    @State private var convertedVolumeValue: String = ""
    let volumeUnits: [UnitVolume] = [.liters, .milliliters, .gallons, .cups, .quarts]

    @State private var selectedConversionType: String = "Length"

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select Conversion Type")) {
                    Picker("Conversion Type", selection: $selectedConversionType) {
                        Text("Length").tag("Length")
                        Text("Temperature").tag("Temperature")
                        Text("Time").tag("Time")
                        Text("Volume").tag("Volume")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .fixedSize()
                      
                }

                // Length Conversion Section
                if selectedConversionType == "Length" {
                    Section(header: Text("Length Conversion")) {
                        TextField("Enter value", text: $inputValue)
                            .keyboardType(.decimalPad)
                            .onChange(of: inputValue) { _ in convertLength() }

                        Picker("From Unit", selection: $inputUnit) {
                            ForEach(lengthUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Picker("To Unit", selection: $outputUnit) {
                            ForEach(lengthUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Text("Converted Value: \(convertedValue)")
                    }
                }

                // Temperature Conversion Section
                if selectedConversionType == "Temperature" {
                    Section(header: Text("Temperature Conversion")) {
                        TextField("Enter value", text: $inputTempValue)
                            .keyboardType(.decimalPad)
                            .onChange(of: inputTempValue) { _ in convertTemperature() }

                        Picker("From Unit", selection: $inputTempUnit) {
                            ForEach(temperatureUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Picker("To Unit", selection: $outputTempUnit) {
                            ForEach(temperatureUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Text("Converted Value: \(convertedTempValue)")
                    }
                }

                // Time Conversion Section
                if selectedConversionType == "Time" {
                    Section(header: Text("Time Conversion")) {
                        TextField("Enter value", text: $inputTimeValue)
                            .keyboardType(.decimalPad)
                            .onChange(of: inputTimeValue) { _ in convertTime() }

                        Picker("From Unit", selection: $inputTimeUnit) {
                            ForEach(timeUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Picker("To Unit", selection: $outputTimeUnit) {
                            ForEach(timeUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Text("Converted Value: \(convertedTimeValue)")
                    }
                }

                // Volume Conversion Section
                if selectedConversionType == "Volume" {
                    Section(header: Text("Volume Conversion")) {
                        TextField("Enter value", text: $inputVolumeValue)
                            .keyboardType(.decimalPad)
                            .onChange(of: inputVolumeValue) { _ in convertVolume() }

                        Picker("From Unit", selection: $inputVolumeUnit) {
                            ForEach(volumeUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Picker("To Unit", selection: $outputVolumeUnit) {
                            ForEach(volumeUnits, id: \.self) { unit in
                                Text(unit.symbol).tag(unit)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())

                        Text("Converted Value: \(convertedVolumeValue)")
                    }
                }
            }
            .navigationTitle("Unit Converter")
        }
    }

    // Length Conversion Function
    func convertLength() {
        guard let value = Double(inputValue) else {
            convertedValue = "Invalid input"
            return
        }
        let inputMeasurement = Measurement(value: value, unit: inputUnit)
        let convertedMeasurement = inputMeasurement.converted(to: outputUnit)
        convertedValue = String(format: "%.2f", convertedMeasurement.value)
    }

    // Temperature Conversion Function
    func convertTemperature() {
        guard let value = Double(inputTempValue) else {
            convertedTempValue = "Invalid input"
            return
        }
        let inputMeasurement = Measurement(value: value, unit: inputTempUnit)
        let convertedMeasurement = inputMeasurement.converted(to: outputTempUnit)
        convertedTempValue = String(format: "%.2f", convertedMeasurement.value)
    }

    // Time Conversion Function
    func convertTime() {
        guard let value = Double(inputTimeValue) else {
            convertedTimeValue = "Invalid input"
            return
        }
        let inputMeasurement = Measurement(value: value, unit: inputTimeUnit)
        let convertedMeasurement = inputMeasurement.converted(to: outputTimeUnit)
        convertedTimeValue = String(format: "%.2f", convertedMeasurement.value)
    }

    // Volume Conversion Function
    func convertVolume() {
        guard let value = Double(inputVolumeValue) else {
            convertedVolumeValue = "Invalid input"
            return
        }
        let inputMeasurement = Measurement(value: value, unit: inputVolumeUnit)
        let convertedMeasurement = inputMeasurement.converted(to: outputVolumeUnit)
        convertedVolumeValue = String(format: "%.2f", convertedMeasurement.value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
