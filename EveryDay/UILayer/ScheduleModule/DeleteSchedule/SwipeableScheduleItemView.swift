//
//  SwipeableScheduleItemView.swift
//  EveryDay
//
//  Created by Alexander Suprun on 17.06.2024.
//
import SwiftUI
import RealmSwift

struct SwipeableScheduleItemView: View {
    @ObservedRealmObject var scheduleList: ScheduleList
    @State private var offset: CGFloat = 0
    var colorSet: ColorSet
    var onDelete: () -> Void

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button(action: {
                    onDelete()
                }) {
                    Image(systemName: "clear.fill")
                        .font(.system(size: 70))
                        .cornerRadius(8)
                        .customTitleStyle()
                }
                .padding(.trailing, 30)
            }
            if !scheduleList.isInvalidated {
                ScheduleCustomItemView(event: scheduleList, colorSet: colorSet)
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                withAnimation {
                                    if gesture.translation.width < 0 {
                                        if gesture.translation.width > -UIScreen.main.bounds.size.width + 80 {
                                            offset = gesture.translation.width
                                        } else {
                                            onDelete()
                                            offset = 0  // Сброс смещения после удаления
                                        }
                                    } else {
                                        offset = 0
                                    }
                                }
                            }
                            .onEnded { _ in
                                withAnimation {
                                    offset = 0
                                }
                            }
                    )
                    .padding(.vertical)
            }
        }
    }
}
