//
//  VToggleToggleView.swift
//  VComponents
//
//  Created by Vakhtang Kontridze on 12/21/20.
//

import SwiftUI

// MARK:- V Toggle Toggle View
struct VToggleToggleView: View {
    // MARK: Properties
    private let size: CGSize
    private let thumbDimension: CGFloat
    private let animationOffset: CGFloat
    
    private let fillColor: Color
    private let thumbColor: Color
    
    private let isOn: Bool
    private let isDisabled: Bool
    
    private let action: () -> Void
    
    // MARK: Initializers
    init(
        size: CGSize,
        thumbDimension: CGFloat,
        animationOffset: CGFloat,
        fillColor: Color,
        thumbColor: Color,
        isOn: Bool,
        isDisabled: Bool,
        action: @escaping () -> Void
    ) {
        self.size = size
        self.thumbDimension = thumbDimension
        self.animationOffset = animationOffset
        self.fillColor = fillColor
        self.thumbColor = thumbColor
        self.isOn = isOn
        self.isDisabled = isDisabled
        self.action = action
    }
}

// MARK:- Body
extension VToggleToggleView {
    var body: some View {
        VInteractiveView(isDisabled: isDisabled, action: action, onPress: { _ in }, content: {
            ZStack(content: {
                RoundedRectangle(cornerRadius: size.height)
                    .foregroundColor(fillColor)

                Circle()
                    .frame(dimension: thumbDimension)
                    .foregroundColor(thumbColor)
                    .offset(
                        x: isOn ? animationOffset : -animationOffset,
                        y: 0
                    )
            })
                .frame(size: size)
        })
    }
}

// MARK:- Preview
struct VToggleToggleView_Previews: PreviewProvider {
    static var previews: some View {
        VToggleToggleView(
            size: VToggleStandardModel.Layout().size,
            thumbDimension: VToggleStandardModel.Layout().thumbDimension,
            animationOffset: VToggleStandardModel.Layout().animationOffset,
            fillColor: VToggleStandardModel.Colors().fill.enabledOn,
            thumbColor: VToggleStandardModel.Colors().thumb.enabledOn,
            isOn: true,
            isDisabled: false,
            action: {}
        )
    }
}
