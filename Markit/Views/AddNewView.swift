//
//  AddNewView.swift
//  Markit
//
//  Created by Zayn on 4/5/22.
//

import SwiftUI

struct AddNewView: View {
	
	@ObservedObject var vm: HomeViewModal
	@Environment(\.managedObjectContext) var context
	
	var body: some View {
		VStack {
			VStack {
				HStack {
					VStack {
						Text(vm.toBeUpdated == nil ? "Add A New Todo" : "Update Todo")
							.font(.system(size: 60, weight: .bold, design: .default))
						
					}
					Spacer()
				}
				if (vm.toBeUpdated != nil) {
					Text("(\(vm.title))")
				}
				TextField("Todo Title", text: $vm.title)
					.padding()
					.foregroundColor(Color(.systemGray4))
					.background(vm.cardBGColor(cardColor: vm.cardColor))
					.cornerRadius(7)
					.shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
				
				HStack {
					ForEach(vm.allColors, id: \.self) { pickedColor in
						Button(action: {
							vm.cardColor = pickedColor
						}){
							
							if vm.cardColor == pickedColor {
								Spacer()
								Circle()
									.fill(vm.cardBGColor(cardColor: pickedColor))
									.background(Color.black)
									.frame(width: 21, height: 21)
									.cornerRadius(100)
									.shadow(color: Color.black.opacity(0.9), radius: 3, x: 0, y: 0)
								Spacer()
							} else {
								Spacer()
								Circle()
									.fill(vm.cardBGColor(cardColor: pickedColor))
									.frame(width: 20, height: 20)
								Spacer()
							}
							
							
						}
					}
					
				}
				.padding()
				.background(Color.white)
				.cornerRadius(7)
				.shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
				.padding(.vertical)
				
				Spacer()
				Button(action: {
					vm.addTodo()
				}){
					Text(vm.toBeUpdated == nil ? "Save todo" : "Update todo")
						.frame(maxWidth: .infinity)
				}
				.frame(maxWidth: .infinity)
				.padding()
				.font(.system(size: 18, weight: .bold))
				.foregroundColor(.white)
				.background(Color.pink)
				.shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
				.cornerRadius(16)
				.padding(.vertical)
				.ignoresSafeArea(.keyboard, edges: .bottom)
				
				
				
			}
			.padding(.horizontal)
			
		}
		.padding(.vertical)
		.edgesIgnoringSafeArea(.bottom)
		
		
	}
	
}




struct AddNewView_Previews: PreviewProvider {
	static var previews: some View {
		AddNewView(vm: HomeViewModal())
	}
}
