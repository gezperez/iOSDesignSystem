import SwiftUI

public struct DSHeaderProps {
    public var title: String?
    public var leftIconProps: DSCircularIconButtonProps?
    public var rightIconProps: DSCircularIconButtonProps?
    public var onBackButtonPressed: (() -> Void)?
    
    public init(
        title: String? = nil,
        leftIconProps: DSCircularIconButtonProps? = nil,
        rightIconProps: DSCircularIconButtonProps? = nil,
        onBackButtonPressed: (() -> Void)? = nil
    ) {
        self.title = title
        self.leftIconProps = leftIconProps
        self.rightIconProps = rightIconProps
        self.onBackButtonPressed = onBackButtonPressed
    }
}

public struct DSHeader: View {
    public var headerProps: DSHeaderProps
    
    @StateObject private var themeManager = ThemeManager()
    
    public init(headerProps: DSHeaderProps) {
        self.headerProps = headerProps
    }
    
    private func renderLeftIcon() -> some View  {
        
        if let leftIconProps = headerProps.leftIconProps {
            
            return AnyView(
                DSCircularIconButton(
                    buttonProps: DSCircularIconButtonProps(
                        systemImageName: leftIconProps.systemImageName,
                        variant: .primary,
                        action: {
                            if let rightAction = headerProps.leftIconProps?.action {
                                return rightAction()
                            }
                            
                            return {}()
                        },
                        size: .sm,
                        isLoading: leftIconProps.isLoading!
                    )
                )
                
            )
            
            
            
        }
        
        
        if headerProps.onBackButtonPressed != nil {
            
            return AnyView(
                DSCircularIconButton(
                    buttonProps: DSCircularIconButtonProps(
                        systemImageName: "arrow.left",
                        variant: .primary,
                        action: {
                            if let onBackButtonPressed = headerProps.onBackButtonPressed {
                                return onBackButtonPressed()
                            }
                            
                            return {}()
                        },
                        size: .sm
                    )
                )
                
            )
            
            
        }
        
        return AnyView(EmptyView())
        
    }
    
    private func renderRightIcon() -> some View {
        
        if let rightIconProps = headerProps.rightIconProps {
            
            return AnyView(
                DSCircularIconButton(
                    buttonProps: DSCircularIconButtonProps(
                        systemImageName: rightIconProps.systemImageName,
                        variant: .primary,
                        action: {
                            if let rightAction = headerProps.rightIconProps?.action {
                                return rightAction()
                            }
                            
                            return {}()
                        },
                        size: .sm,
                        isLoading: rightIconProps.isLoading!
                    )
                )
                
            )
            
        }
        
        if headerProps.onBackButtonPressed != nil {
            
            return AnyView(
                DSCircularIconButton(
                    buttonProps: DSCircularIconButtonProps(
                        systemImageName: "arrow.left",
                        variant: .primary,
                        action: {},
                        size: .sm
                    )
                )
                .hidden()
                
            )
            
            
        }
        
        
        return AnyView(EmptyView())
    }
    
    public var body: some View {
        HStack {
            renderLeftIcon()
            
            Spacer()
            
            if let title = headerProps.title {
                
                Text(title)
                    .font(themeManager.current.bodyLargeBold)
                    .bold()
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                    .foregroundColor(themeManager.current.onBackground)
                    .multilineTextAlignment(.center)
                
            }
            
            Spacer()
            
            renderRightIcon()
        }
        .padding()
        .background(themeManager.current.background)
    }
}

#Preview {
    DSContainer {
        DSHeader(
            headerProps: DSHeaderProps(
                title: "Title Large Title Large Title Large",
                onBackButtonPressed: {
                    
                }
            )
        )
    }
}
