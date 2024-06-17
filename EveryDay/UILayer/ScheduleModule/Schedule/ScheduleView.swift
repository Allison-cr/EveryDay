import SwiftUI

struct ScheduleView: View {
    @StateObject private var viewModel = ScheduleViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .customTitleStyle()
                    .padding(.top)
                
                Text("\(viewModel.capitalizeFirstLetter(viewModel.currentDay)), today is \(viewModel.currentParityWeek) week")
                    .padding(.leading)
                    .customTitleStyle()
                
                ScrollView {
                    VStack {
                        if viewModel.scheduleLists.isEmpty {
                            Text("No data")
                        } else {
                            ForEach(Array(viewModel.scheduleLists.enumerated()), id: \.element.id) { index, scheduleList in
                                SwipeableScheduleItemView(
                                    scheduleList: scheduleList,
                                    colorSet: viewModel.colorSets[index % viewModel.colorSets.count],
                                    onDelete: {
                                        viewModel.deleteSchedule(scheduleList)
                                    }
                                )
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isPresented = true
                            } label: {
                                Image(systemName: "plus")
                                    .customTitleStyle()
                            }
                            .buttonStyle(ScaleButtonStyle())
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Activities")
                                .customTitleStyle()
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

private extension ScheduleView {
    struct ScaleButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label.scaleEffect(
                configuration.isPressed ? 1.5 : 1)
        }
    }

    struct CustomTitleModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(
                    colors: [.purple, .blue, .cyan],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
        }
    }
}
extension View {
    func customTitleStyle() -> some View {
        self.modifier(ScheduleView.CustomTitleModifier())
    }
}


