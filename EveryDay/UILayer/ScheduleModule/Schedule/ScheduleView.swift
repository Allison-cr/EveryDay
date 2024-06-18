import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    @ObservedObject private var colorPickerViewModel = ColorPickerViewModel()
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .customTitleStyle(colors: colorPickerViewModel.colorSet())
                    .padding(.top)
                
                Text("\(viewModel.capitalizeFirstLetter(viewModel.currentDay)), today is \(viewModel.currentParityWeek) week")
                    .padding(.leading)
                    .customTitleStyle(colors:colorPickerViewModel.colorSet())
                
                ScrollView {
                    VStack {
                            ForEach(Array(viewModel.scheduleLists.enumerated()), id: \.element.id) { index, scheduleList in
                                SwipeableScheduleItemView(
                                    scheduleList: scheduleList,
                                    onDelete: {
                                        viewModel.deleteSchedule(scheduleList)
                                    }
                                )
                        }
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .navigationBarTrailing) {
                            Button {
                                isPresented = true
                            } label: {
                                Image(systemName: "plus")
                            }
                            .buttonStyle(ScaleButtonStyle())
                        }
                        ToolbarItemGroup(placement: .navigationBarLeading) {
                            Text("Activities")
                                .customTitleStyle(colors:colorPickerViewModel.colorSet())
                        }
                    }
                    .sheet(isPresented: $isPresented) {
                        AddScheduleView()
                    }
                }
            }
        }
    }
}

#Preview {
    ScheduleView()
}
