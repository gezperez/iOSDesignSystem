import SwiftUI

private extension View {
    func textFieldStyle() -> some View {
        self
            .padding()
            .cornerRadius(CornerRadius.md.rawValue)
    }
}

public struct DSInputProps {
    public var text: Binding<String>
    public var placeholder: String?
    public var isSecure: Bool?
    public var errorMessage: String?
    public var title: String?
    public var isDisabled: Bool?
    public var isLoading: Bool?
    public var rightIcon: String?
    
    public init(
        text: Binding<String>,
        placeholder: String? = nil,
        isSecure: Bool? = nil,
        errorMessage: String? = nil,
        title: String? = nil,
        isDisabled: Bool? = false,
        isLoading: Bool? = false,
        rightIcon: String? = nil
    ) {
        self.text = text
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.errorMessage = errorMessage
        self.title = title
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.rightIcon = rightIcon
    }
}

struct InputColorScheme {
    var textColor: Color
    var borderColor: Color
    var borderWidth: CGFloat
    var padding: CGFloat
}

public struct DSInputField: View {
    public var inputProps: DSInputProps
    @State private var isSecure: Bool
    @StateObject private var themeManager = ThemeManager()
    
    @FocusState private var isFocusedField: Bool
    
    public init(inputProps: DSInputProps) {
        self.inputProps = inputProps
        self._isSecure = State(initialValue: inputProps.isSecure ?? false)
    }
    
    private func toggleSecureInput() {
        isSecure.toggle()
    }
    
    private var isInputDisabled: Bool {
        (inputProps.isDisabled ?? false) || (inputProps.isLoading ?? false)
    }
    
    private func renderRightIcon() -> some View {
        let inputScheme = self.inputScheme()
        
        let iconColor = inputProps.isDisabled ?? false ? themeManager.current.surfaceOutline : themeManager.current.primary
        
        if inputProps.isLoading == true {
            return AnyView(
                ProgressView()
                    .tint(themeManager.current.primary)
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity, alignment: .trailing)
            )
        } else if let showSecureIcon = inputProps.isSecure {
            return AnyView(
                Button(action: toggleSecureInput) {
                    DSIcon(
                        iconProps: DSIconProps(
                            systemImageName: isSecure ? "eye.slash" : "eye",
                            size: .sm,
                            color: iconColor
                        )
                    )
                }
                    .disabled(isInputDisabled)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            )
        } else if let rightIcon = inputProps.rightIcon {
            return AnyView(
                DSIcon(
                    iconProps: DSIconProps(
                        systemImageName: rightIcon,
                        size: .sm,
                        color: iconColor
                    )
                )
                .frame(maxWidth: .infinity, alignment: .trailing)
            )
        } else {
            return AnyView(EmptyView())
        }
    }
    
    private func renderMessage() -> some View {
        if let errorMessage = inputProps.errorMessage,
           !inputProps.isDisabled! && !errorMessage.isEmpty && !inputProps.isLoading! {
            return AnyView(
                Text(errorMessage)
                    .font(TypographyVariant.bodySmallBold)
                    .foregroundColor(themeManager.current.danger)
                    .padding(.top, 2)
            )
        }
        
        return AnyView(EmptyView())
    }
    
    private func inputScheme() -> InputColorScheme {
        
        if inputProps.isDisabled! {
            return InputColorScheme(
                textColor: themeManager.current.surfaceDisabled,
                borderColor: themeManager.current.surfaceDisabled,
                borderWidth: 1,
                padding: 1
            )
        } else if inputProps.isLoading! {
            return InputColorScheme(
                textColor: themeManager.current.surfaceOutline,
                borderColor: themeManager.current.surfaceOutline,
                borderWidth: 1,
                padding: 1
            )
        } else if isFocusedField {
            return InputColorScheme(
                textColor: themeManager.current.primary,
                borderColor: themeManager.current.primary,
                borderWidth: 2,
                padding: 0
            )
        } else if let errorMessage = inputProps.errorMessage, !errorMessage.isEmpty {
            return InputColorScheme(
                textColor: themeManager.current.surfaceOutline,
                borderColor: themeManager.current.danger,
                borderWidth: 2,
                padding: 0
            )
        } else {
            return InputColorScheme(
                textColor: themeManager.current.surfaceOutline,
                borderColor: themeManager.current.surfaceOutline,
                borderWidth: 1,
                padding: 0
            )
        }
        
    }
    
    public var body: some View {
        
        let inputScheme = self.inputScheme()
        
        VStack(alignment: .leading) {
            if let title = inputProps.title, !title.isEmpty {
                Text(title)
                    .font(TypographyVariant.bodyDefaultRegular)
                    .foregroundColor(themeManager.current.primary)
            }
            
            ZStack {
                
                Group {
                    if isSecure {
                        SecureField(inputProps.placeholder ?? "", text: inputProps.text)
                            .focused($isFocusedField)
                            .disabled(isInputDisabled)
                            .tint(themeManager.current.secondary)
                    } else {
                        TextField(inputProps.placeholder ?? "", text: inputProps.text)
                            .focused($isFocusedField)
                            .disabled(isInputDisabled)
                            .tint(themeManager.current.secondary)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 62)
                .padding(.horizontal)
                .padding(inputScheme.padding)
                .foregroundColor(themeManager.current.primary)
                .font(TypographyVariant.bodyDefaultBold)
                .overlay(
                    RoundedRectangle(
                        cornerRadius: CornerRadius.infinite.rawValue
                    )
                    .stroke(
                        inputScheme.borderColor,
                        lineWidth: inputScheme.borderWidth
                    )
                )
                .animation(.easeInOut(duration: 0.2), value: isFocusedField)
                
                renderRightIcon()
                    .padding(.trailing)
            }
            
            renderMessage()
        }
    }
}

#Preview {
    let theme = LightTheme()
    
    VStack {
        DSInputField(
            inputProps: DSInputProps(
                text: .constant(""),
                placeholder: "Placeholder",
                errorMessage: "Error Message",
                title: "Title",
                isLoading: true
            )
        )
        .padding(.bottom)
        
        DSInputField(
            inputProps: DSInputProps(
                text: .constant(""),
                placeholder: "Placeholder",
                errorMessage: "Error Message",
                title: "Title",
                isDisabled: true
            )
        )
        .padding(.bottom)
        
        DSInputField(
            inputProps: DSInputProps(
                text: .constant(""),
                placeholder: "Placeholder",
                title: "Title"
            )
        )
        .padding(.bottom)
        
        DSInputField(inputProps: DSInputProps(
            text: .constant(""),
            placeholder: "Password Placeholder",
            isSecure: true,
            errorMessage: "Error Message",
            title: "Title"
        ))
        .padding(.bottom)
        
        DSInputField(inputProps: DSInputProps(
            text: .constant(""),
            placeholder: "Placeholder",
            errorMessage: "Error Message",
            rightIcon: "heart.fill"
        )
        )
        .padding(.bottom)
        
        DSInputField(inputProps: DSInputProps(
            text: .constant(""),
            placeholder: "Placeholder",
            errorMessage: "Error Message"
        )
        )
        .padding(.bottom)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding()
    .background(theme.background)
}
