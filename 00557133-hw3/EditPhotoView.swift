//
//  EditPhotoView.swift
//  00557133-hw3
//
//  Created by User04 on 2019/11/12.
//  Copyright © 2019 Yaoder. All rights reserved.
//

import SwiftUI

struct EditPhotoView: View {
    @State private var scale:CGFloat = 1
    @State private var seleteindex = 0
    @State private var text = ""
    @State private var text1 = false
    @State private var change = false
    var pic = ["1","2","3","4","5"]
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("封面")
                Image((self.pic[self.seleteindex]))
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                    .clipped()
                    .scaleEffect(self.scale)
                Button("輸入評論"){
                    self.text1 = true
                }
                if self.text1{
                    TextField("你覺得帥不帥？只能說帥", text: self.$text)
                }
                Form{
                    Text("大小")
                    Slider(value: self.$scale , in:0...2)
                    Toggle("點開可加減", isOn: self.$change)
                    if self.change{
                        Stepper(value: self.$seleteindex , in:0...4){
                            Text("下一代")
                        }
                    }
                    Picker(selection: self.$seleteindex, label: Text("歷代封面"))
                        {
                            Text(self.pic[0]).tag(0)
                            Text(self.pic[1]).tag(2)
                            Text(self.pic[2]).tag(2)
                            Text(self.pic[3]).tag(3)
                            Text(self.pic[4]).tag(4)
                    }.pickerStyle(WheelPickerStyle())
                }
            }
        }
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView()
    }
}
