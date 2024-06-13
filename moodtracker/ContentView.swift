import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MoodViewModel()
    @State private var selectedMood: String = ""

    let moods = ["Happy", "Sad", "Neutral", "Angry", "Excited"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Select your mood", selection: $selectedMood) {
                    ForEach(moods, id: \.self) { mood in
                        Text(mood)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Button(action: {
                    if !selectedMood.isEmpty {
                        viewModel.addMood(mood: selectedMood)
                        selectedMood = ""
                    }
                }) {
                    Text("Save Mood")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                NavigationLink(destination: MoodHistoryView(viewModel: viewModel)) {
                    Text("View Mood History")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Mood Tracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
