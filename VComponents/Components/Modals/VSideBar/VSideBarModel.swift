//
//  VSideBarModelStandard.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/24/20.
//

import SwiftUI

// MARK:- V Side Bar Model
public struct VSideBarModel {
    public var layout: Layout = .init()
    public var colors: Colors = .init()
    
    var sheetModel: VSheetModel {
        var model: VSheetModel = .init()
        
        model.layout.roundedCorners = layout.roundCorners ? .custom([.topRight, .bottomRight]) : .none
        model.layout.cornerRadius = layout.cornerRadius
        model.layout.contentPadding = 0
        
        model.color = colors.background
        
        return model
    }
    
    public init() {}
}

// MARK:- Layout
extension VSideBarModel {
    public struct Layout {
        public var width: Width = .relative()
        
        public var cornerRadius: CGFloat = 20
        var roundCorners: Bool { cornerRadius > 0 }
        
        public var contentMargin: ContentMargin = .init()
        
        public init() {}
    }
}

extension VSideBarModel.Layout {
    public enum Width {
        case relative(_ screenRatio: CGFloat = 2/3)
        case fixed(_ width: CGFloat = 300)
        
        var value: CGFloat {
            switch self {
            case .relative(let ratio): return UIScreen.main.bounds.width * ratio
            case .fixed(let width): return width
            }
        }
    }
}

extension VSideBarModel.Layout {
    public struct ContentMargin {
        public var leading: CGFloat = 20
        public var trailing: CGFloat = 20
        public var top: CGFloat = 20
        public var bottom: CGFloat = 20
        
        public init() {}
    }
}

// MARK:- Colors
extension VSideBarModel {
    public struct Colors {
        public static let sheetColor: Color = VSheetModel().color
        
        public var background: Color = sheetColor
        public var blinding: Color = .init(componentAsset: "SideBar.Blinding")
        
        public init() {}
    }
}
