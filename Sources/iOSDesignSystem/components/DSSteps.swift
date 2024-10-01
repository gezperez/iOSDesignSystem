import SwiftUI

public struct DSStepsProps {
    public var currentStep: Binding<Int>
    public var totalSteps: Int
    
    public init(
        currentStep: Binding<Int>,
        totalSteps: Int
    ) {
        self.currentStep = currentStep
        self.totalSteps = totalSteps
    }
}

public struct DSSteps: View {
    public var stepsProps: DSStepsProps
    
    public init(
        stepsProps: DSStepsProps
    ) {
        self.stepsProps = stepsProps
    }
    
    @StateObject private var themeManager = ThemeManager()
    
    public var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<stepsProps.totalSteps, id: \.self) { index in
                RoundedRectangle(cornerRadius: 6 / 2)
                    .fill(
                        index <= stepsProps.currentStep.wrappedValue ? themeManager.current.primary : themeManager.current.surfaceDisabled
                    )
                    .frame(width: 20, height: 6)
                    .animation(
                        .easeInOut(duration: 0.3),
                        value: stepsProps.currentStep.wrappedValue
                    )
            }
        }
        .padding(.horizontal)
    }
}
