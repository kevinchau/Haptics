import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Impact Feedback Section
                    HapticSection(title: "Impact Feedback") {
                        HapticButton(title: "Light", color: .blue) {
                            let generator = UIImpactFeedbackGenerator(style: .light)
                            generator.impactOccurred()
                        }
                        HapticButton(title: "Medium", color: .blue) {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                        }
                        HapticButton(title: "Heavy", color: .blue) {
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.impactOccurred()
                        }
                        HapticButton(title: "Soft", color: .cyan) {
                            let generator = UIImpactFeedbackGenerator(style: .soft)
                            generator.impactOccurred()
                        }
                        HapticButton(title: "Rigid", color: .cyan) {
                            let generator = UIImpactFeedbackGenerator(style: .rigid)
                            generator.impactOccurred()
                        }
                    }

                    // Selection Feedback Section
                    HapticSection(title: "Selection Feedback") {
                        HapticButton(title: "Selection Changed", color: .purple) {
                            let generator = UISelectionFeedbackGenerator()
                            generator.selectionChanged()
                        }
                    }

                    // Notification Feedback Section
                    HapticSection(title: "Notification Feedback") {
                        HapticButton(title: "Success", color: .green) {
                            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.success)
                        }
                        HapticButton(title: "Warning", color: .orange) {
                            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.warning)
                        }
                        HapticButton(title: "Error", color: .red) {
                            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.error)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Haptics")
        }
    }
}

struct HapticSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.secondary)

            VStack(spacing: 10) {
                content
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HapticButton: View {
    let title: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body.weight(.medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(color)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    ContentView()
}
