import SwiftUI

public struct CornerRadius: Sendable {
    public let value: CGFloat
    
    public static let sm = CornerRadius(value: 4)
    public static let md = CornerRadius(value: 8)
    public static let lg = CornerRadius(value: 16)
    public static let xl = CornerRadius(value: 24)
    public static let infinite = CornerRadius(value: .greatestFiniteMagnitude)
    
    public var rawValue: CGFloat {
        return value
    }
}

#Preview {
    VStack {
        Text("Small Corner Radius")
            .padding()
            .background(Color.gray)
            .cornerRadius(CornerRadius.sm.rawValue)
            .padding()
        
        Text("Medium Corner Radius")
            .padding()
            .background(Color.gray)
            .cornerRadius(CornerRadius.md.rawValue)
            .padding()
        
        Text("Large Corner Radius")
            .padding()
            .background(Color.gray)
            .cornerRadius(CornerRadius.lg.rawValue)
            .padding()
        
        Text("Large Corner Radius")
            .padding()
            .background(Color.gray)
            .cornerRadius(CornerRadius.infinite.rawValue)
            .padding()
    }
}
