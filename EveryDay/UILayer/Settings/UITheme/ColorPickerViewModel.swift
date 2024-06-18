//
//  ColorPickerViewModel.swift
//  EveryDay
//
//  Created by Alexander Suprun on 18.06.2024.
//
import SwiftUI
import Combine

class ColorPickerViewModel: ObservableObject {
    @Published var firstColor: Color
    @Published var secondColor: Color
    @Published var thirdColor: Color

    init() {
        self.firstColor = ColorPickerViewModel.loadColor(forKey: "firstColor") ?? .purple
        self.secondColor = ColorPickerViewModel.loadColor(forKey: "secondColor") ?? .blue
        self.thirdColor = ColorPickerViewModel.loadColor(forKey: "thirdColor") ?? .cyan

        self.$firstColor
            .sink { ColorPickerViewModel.saveColor($0, forKey: "firstColor") }
            .store(in: &cancellables)

        self.$secondColor
            .sink { ColorPickerViewModel.saveColor($0, forKey: "secondColor") }
            .store(in: &cancellables)

        self.$thirdColor
            .sink { ColorPickerViewModel.saveColor($0, forKey: "thirdColor") }
            .store(in: &cancellables)
    }
    
    func colorSet() -> [Color] {
        return [firstColor, secondColor, thirdColor]
    }


    private static func saveColor(_ color: Color, forKey key: String) {
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(color), requiringSecureCoding: false) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private static func loadColor(forKey key: String) -> Color? {
        if let data = UserDefaults.standard.data(forKey: key),
           let uiColor = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor {
            return Color(uiColor)
        }
        return nil
    }

    private var cancellables = Set<AnyCancellable>()
}
