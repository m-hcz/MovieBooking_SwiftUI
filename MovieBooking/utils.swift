
import UIKit
import SwiftUI
import Foundation

//https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func glow(color: Color = .red, radius: CGFloat = 20) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}

//https://stackoverflow.com/questions/58526632/swiftui-create-a-single-dashed-line-with-swiftui
struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

//https://rekerrsive.medium.com/three-ways-to-pop-to-the-root-view-in-a-swiftui-navigationview-430aee720c9a
struct NavigationUtil {
    static func popToRootView() {
        findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)?
            .popToRootViewController(animated: true)
    }
static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
return nil
    }
}

extension Color {
	static let bgColor = Color("backgroundColor")
	static let bgColor2 = Color("backgroundColor2")
	static let cyan = Color("cyan")
	static let greenCircle = Color("greenCircle")
	static let grey = Color("grey")
	static let lightBlue = Color("lightBlue")
	static let lightPurple = Color("lightPurple")
	static let majenta = Color("majenta")
	static let pink = Color("pink")
	static let pinkCircle = Color("pinkCircle")
	static let purple = Color("purple")
	
	static let bgColorsGrad = [Color.bgColor, Color.bgColor2]
}


