//
//  ColorPicker.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI

struct ColorPickerButton: View {
    @ObservedObject var viewModel: ColorPickerViewModel

    var body: some View {
        VStack {
            Text("Choose Color")
                .font(.title2.bold())
                .padding()
            VStack {
                ColorPicker("First Color", selection: $viewModel.firstColor)
                ColorPicker("Second Color", selection: $viewModel.secondColor)
                ColorPicker("Third Color", selection: $viewModel.thirdColor)
                
            }
            .padding()
            Rectangle()
                .frame(height: 100)
                .cornerRadius(8)
                .padding()
                .customTitleStyle(colors: viewModel.colorSet())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(.themeBG)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
    }
}

#Preview {
    ColorPickerButton(viewModel: ColorPickerViewModel())
}
