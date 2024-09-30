import SwiftUI

public struct DSContainerButtonProps {
    public var title: String
    public var action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public init(buttonProps: DSButtonProps) {
        self.title = buttonProps.title
        self.action = buttonProps.action
    }
}

public func convertToButtonProps(props: DSContainerButtonProps, variant: ButtonVariant) -> DSButtonProps {
    return DSButtonProps(
        title: props.title,
        variant: variant,
        action: props.action
    )
}

public struct DSContainer<Content: View>: View {
    public let headerProps: DSHeaderProps?
    public let primaryButtonProps: DSContainerButtonProps?
    public let secondaryButtonProps: DSContainerButtonProps?
    public let content: () -> Content
    
    @StateObject private var themeManager = ThemeManager()
    
    public init(headerProps: DSHeaderProps? = nil,
                primaryButtonProps: DSContainerButtonProps? = nil,
                secondaryButtonProps: DSContainerButtonProps? = nil,
                @ViewBuilder content: @escaping () -> Content) {
        self.headerProps = headerProps
        self.primaryButtonProps = primaryButtonProps
        self.secondaryButtonProps = secondaryButtonProps
        self.content = content
    }
    
    private var hasBottomProps: Bool {
        ((primaryButtonProps != nil) != nil ?? false) ||  (
            (secondaryButtonProps != nil) != nil ?? false
        )
    }
    
    private func renderContent() -> some View {
        if hasBottomProps && headerProps != nil {
            return AnyView(
                ScrollView {
                    content()
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .frame(maxHeight: .infinity)
                .background(themeManager.current.background)
            )
        }
        
        return AnyView(
                    VStack(alignment: .center) {
                        Spacer()
                        content()
                        Spacer()
                    }
                        .padding()
        )
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if let headerProps = headerProps {
                    DSHeader(headerProps: headerProps)
                        .overlay(Rectangle().frame(width: nil, height: 1, alignment: .bottom).foregroundColor(themeManager.current.surfaceOutline), alignment: .bottom)
                }
                
                renderContent()
                    .background(themeManager.current.background)
                
                if hasBottomProps {
                    
                    VStack {
                        if let primaryButtonProps = primaryButtonProps {
                            DSButton(buttonProps: convertToButtonProps(props: primaryButtonProps, variant: .primary))
                        }
                        if let secondaryButtonProps = secondaryButtonProps {
                            DSButton(
                                buttonProps: convertToButtonProps(
                                    props: secondaryButtonProps,
                                    variant: .outlinePrimary
                                )
                            )
                            .padding(.top, 4)
                        }
                    }
                    .padding()
                    .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(themeManager.current.surfaceOutline), alignment: .top)
                    .background(themeManager.current.background)
                }
                
            }
            .environmentObject(ThemeManager())
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DSContainer(
        headerProps: DSHeaderProps(
            title: "Sample Header",
            onBackButtonPressed: {
                
            }
        ),
        primaryButtonProps: DSContainerButtonProps(title: "Primary Button", action: {
            print("Primary Button Pressed")
        }),
        secondaryButtonProps: DSContainerButtonProps(title: "Secondary Button", action: {
            print("Secondary Button Pressed")
        })
    ) {
        ForEach(0..<10) { _ in
            Text("This is the main content area.")
                .font(.body)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(CornerRadius.md.rawValue)
        }
    }
}
