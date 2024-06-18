//
//  ScheduleCustomItemView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//

import SwiftUI
import CoreLocation
import RealmSwift

struct ScheduleCustomItemView: View {
    var event : ScheduleList
    var colorSet: LinearGradient

    var body: some View {
        ZStack {
            colorSet
            VStack(alignment: .leading, spacing: 0) {
                Text("\(event.title)")
                    .font(.system(size: 40, weight: .bold))
                    .lineLimit(2)
                HStack {
                    Text(event.teacher)
                        .lineLimit(1)
                    Spacer()
                    Text(event.location)
                        .lineLimit(1)
                }
                .padding(.vertical, 12)
                .font(.system(size: 32, weight: .bold))
                HStack(spacing: 30) {
                    Text(formatTime(event.timestart))
                    Spacer()
                    Text(formatTime(event.timeend))
                }
                .font(.system(size: 36,weight: .bold))
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, 16)
        }
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.size.width - 40, height:  UIScreen.main.bounds.size.height / 4 + 20)
        .cornerRadius(25)
    }
}

#Preview
{
    let testEvent = ScheduleList()
    testEvent.title = "Math Class"
    testEvent.teacher = "John Doe"
    testEvent.timestart = Date()
    testEvent.timeend = Date()
    testEvent.location = "Room 101"
    testEvent.week = ParityWeek.honest.rawValue
    testEvent.day = Days.monday.rawValue

    let testColorSet = LinearGradient(
        colors: [.purple, .blue, .cyan],
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
    return ScheduleCustomItemView(event: testEvent, colorSet: testColorSet)
}

#Preview
{
    ScheduleView()

}

extension ScheduleCustomItemView {
    func formatTime(_ time: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: time)
    }
}
