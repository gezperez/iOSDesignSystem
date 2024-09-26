import SwiftUI

public struct DSHeaderProps {
    public var title: String
    public var onBackButtonPressed: (() -> Void)?
    
    public init(title: String, onBackButtonPressed: (() -> Void)? = nil) {
        self.title = title
        self.onBackButtonPressed = onBackButtonPressed
    }
}

public struct DSHeader: View {
    public var headerProps: DSHeaderProps
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var themeManager = ThemeManager()
    
    public init(headerProps: DSHeaderProps) {
        self.headerProps = headerProps
    }
    
    private var backAction: () -> Void {
        return {
            if let action = headerProps.onBackButtonPressed {
                action()
            } else {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    public var body: some View {
        HStack {
            Button(action: backAction) {
                DSIcon(iconProps: DSIconProps(systemImageName: "chevron.left", size: .sm, color: themeManager.current.primary))
            }
            

            Spacer()

            Text(headerProps.title)
                .font(TypographyVariant.bodyLargeBold)
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
    DSHeader(headerProps: DSHeaderProps(title: "Title Large Title Large Title Large"))
}
