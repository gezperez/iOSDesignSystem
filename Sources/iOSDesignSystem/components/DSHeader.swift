import SwiftUI

public struct DSHeaderProps {
    public var title: String
    public var onBackButtonPressed: (() -> Void)
    
    public init(title: String, onBackButtonPressed: @escaping (() -> Void)) {
        self.title = title
        self.onBackButtonPressed = onBackButtonPressed
    }
}

public struct DSHeader: View {
    public var headerProps: DSHeaderProps
    
    @StateObject private var themeManager = ThemeManager()
    
    public init(headerProps: DSHeaderProps) {
        self.headerProps = headerProps
    }
    
    private var backAction: () -> Void {
        return {
            headerProps.onBackButtonPressed()
        }
    }

    public var body: some View {
        HStack {
            Button(action: backAction) {
                DSIcon(iconProps: DSIconProps(systemImageName: "chevron.left", size: .sm, color: themeManager.current.primary))
            }
            

            Spacer()

            Text(headerProps.title)
                .font(themeManager.current.bodyLargeBold)
                .bold()
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal)
                .foregroundColor(themeManager.current.onBackground)
                .multilineTextAlignment(.center)

            Spacer()

            DSIcon(iconProps: DSIconProps(systemImageName: "chevron.left", size: .sm, color: themeManager.current.onBackground))
            .hidden()
        }
        .padding()
        .background(themeManager.current.background)
        .environmentObject(ThemeManager())
    }
}

#Preview {
    DSHeader(
        headerProps: DSHeaderProps(
            title: "Title Large Title Large Title Large",
            onBackButtonPressed: {
                
            }
        )
    )
}
