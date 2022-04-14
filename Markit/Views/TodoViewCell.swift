//
//  TodoViewCell.swift
//  Markit
//
//  Created by Zayn on 4/5/22.
//

import SwiftUI

struct TodoViewCell: View {
	
	@ObservedObject var vm = HomeViewModal()
	
	let saved: Makeit
	
    var body: some View {
		VStack {
			HStack {
				
			VStack(alignment: .leading) {
				
				HStack() {
				   
					
					VStack(alignment: .leading) {
						HStack {
							Text("\(saved.title ?? "")")
								.font(.system(size: 18, weight: .bold, design: .default))
								.foregroundColor(Color(.systemGray3))
							
						}
						.padding()
						
						
					}
					
				
			}
				
			}
			Spacer()
				HStack {
					Menu(content: {
						
						Button(action: {
							vm.pinPill(todo: saved)
						}){
							HStack {
								Text(saved.isPinned ? "Unpin" : "Pin")
								Image(systemName: saved.isPinned ? "pin.circle.fill" : "pin.circle")
							}
							
						}
						
						Button(action: {
							vm.updateTodo(todo: saved)
							vm.addSheet.toggle()
						}){
							Text("Edit")
							Image(systemName: "pencil.tip.crop.circle")
						}
						
						Button(action: {
							vm.deleteTodo(todo: saved)
						}){
							Text("Delete")
							Image(systemName: "trash.circle")
						}
						
						
					}){
						Image(systemName: "ellipsis.circle")
							.padding(0)
							.foregroundColor(Color.pink)
							.font(.system(size: 20))
							.background(Color.black)
							.cornerRadius(100)
							.shadow(color: Color.black.opacity(0.7), radius: 6, x: 0, y: 0)
						
					}
				}
		   
		}
		.frame(maxWidth: .infinity)
		.padding()
		.background(vm.cardBGColor(cardColor: saved.cardColor ?? ""))
		.cornerRadius(20)
		.shadow(color: Color.black.opacity(0.1), radius: 7, x: 0, y: 0)
		
		}
		.padding(.vertical, 8)
		.padding(.horizontal)
		
		
    }
}

